#import "Tweak.h"

BOOL noads = YES;
BOOL hideNewsAndTrending = YES;
BOOL hideWhoToFollow = YES;


  %hook NSBundle
  - (id)objectForInfoDictionaryKey:(NSString *)key { 
      if ([key isEqualToString:@"CFBundleIdentifier"]) {
        return @"com.atebits.Tweetie2";
      } else {
        return %orig;
      }
  }

  - (NSString *)bundleIdentifier {
    if (self != [NSBundle mainBundle]) {
      return %orig;
    }    
    return @"com.atebits.Tweetie2";
  }
  %end

  %hook T1SlideshowViewController
  - (void)imageDisplayView:(id)arg1 didLongPress:(id)arg2 {
      %orig;
  }

  - (void)slideshowSeekController:(id)arg1 didLongPressWithRecognizer:(id)arg2 {
      NSString *bid = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIdentifier"];
      UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Welcome" message:bid delegate:nil cancelButtonTitle:@"Thanks" otherButtonTitles:nil];
      [alert show];
      %orig;
  }
  %end



  %hook TFNItemsDataViewController
    - (id)tableViewCellForItem:(id)arg1 atIndexPath:(id)arg2 {
      UITableViewCell *tbvCell = %orig;
      id item = [self itemAtIndexPath: arg2];

      if (noads && [item respondsToSelector: @selector(isPromoted)] && [item performSelector:@selector(isPromoted)]) {
        [tbvCell setHidden: YES];
        return tbvCell;
      }
      
      NSString *itemClassName = NSStringFromClass([item classForCoder]);

      if (hideNewsAndTrending) {
        if ([itemClassName isEqualToString:@"T1Twitter.URTTimelineTrendViewModel"]
            || [itemClassName isEqualToString:@"T1Twitter.URTTimelineEventSummaryViewModel"]
            || [itemClassName isEqualToString:@"T1URTTimelineMessageItemViewModel"]) {
          [tbvCell setHidden: YES];
          return tbvCell;
        }
      }

      if (hideWhoToFollow) {
        if ([itemClassName isEqualToString:@"TFNTwitterUser"] && [NSStringFromClass([self class]) isEqualToString:@"T1HomeTimelineItemsViewController"]) {
          [tbvCell setHidden: YES];
          return tbvCell;
        }

        if ([itemClassName isEqualToString:@"T1URTTimelineUserItemViewModel"] && [((T1URTTimelineUserItemViewModel *)item).scribeComponent isEqualToString:@"suggest_who_to_follow"]) {
          [tbvCell setHidden: YES];
          return tbvCell;
        }

        if ([itemClassName isEqualToString:@"T1Twitter.URTModuleHeaderViewModel"]) {
          // Ivar textIvar = class_getInstanceVariable([item class], "text");
          // id text = object_getIvar(item, textIvar);
          // if ([text isEqualToString:@"Who to follow"]) { }
          [tbvCell setHidden: YES];
          return tbvCell;
        }

        if ([itemClassName isEqualToString:@"T1Twitter.URTTimelineCarouselViewModel"]) {
          [tbvCell setHidden: YES];
          return tbvCell;
        }

        if ([itemClassName isEqualToString:@"T1URTFooterViewModel"] && [((T1URTFooterViewModel *)item).url.absoluteString containsString:@"connect_people"] ) {
          [tbvCell setHidden: YES];
          return tbvCell;
        }

        if ([itemClassName isEqualToString:@"TFNTwitterModuleFooter"] && [((TFNTwitterModuleFooter *)item).url.absoluteString containsString:@"connect_people"] ) {
          [tbvCell setHidden: YES];
          return tbvCell;
        }
      }

      return tbvCell;
    }

    - (double)tableView:(id)arg1 heightForRowAtIndexPath:(id)arg2 {
      id item = [self itemAtIndexPath: arg2];

      if (noads && [item respondsToSelector: @selector(isPromoted)] && [item performSelector:@selector(isPromoted)]) {
        return 0;
      }

      NSString *itemClassName = NSStringFromClass([item classForCoder]);

      if (hideNewsAndTrending) {
        if ([itemClassName isEqualToString:@"T1Twitter.URTTimelineTrendViewModel"]
            || [itemClassName isEqualToString:@"T1Twitter.URTTimelineEventSummaryViewModel"]
            || [itemClassName isEqualToString:@"T1URTTimelineMessageItemViewModel"]) {
          return 0;
        }
      }

      if (hideWhoToFollow) {
        if ([itemClassName isEqualToString:@"TFNTwitterUser"] && [NSStringFromClass([self class]) isEqualToString:@"T1HomeTimelineItemsViewController"]) {
          return 0;
        }

        if ([itemClassName isEqualToString:@"T1URTTimelineUserItemViewModel"] && [((T1URTTimelineUserItemViewModel *)item).scribeComponent isEqualToString:@"suggest_who_to_follow"]) {
          return 0;
        }

        if ([itemClassName isEqualToString:@"T1Twitter.URTModuleHeaderViewModel"]) {
          return 0;
        }

        if ([itemClassName isEqualToString:@"T1Twitter.URTTimelineCarouselViewModel"]) {
          return 0;
        }

        if ([itemClassName isEqualToString:@"T1URTFooterViewModel"] && [((T1URTFooterViewModel *)item).url.absoluteString containsString:@"connect_people"] ) {
          return 0;
        }

        if ([itemClassName isEqualToString:@"TFNTwitterModuleFooter"] && [((TFNTwitterModuleFooter *)item).url.absoluteString containsString:@"connect_people"] ) {
          return 0;
        }
      }

      return %orig;
    }

    - (double)tableView:(id)arg1 heightForHeaderInSection:(long long)arg2 {
      if (self.sections 
          && self.sections[arg2] 
          && ((NSArray* )self.sections[arg2]).count
          && self.sections[arg2][0]) {
        NSString *sectionClassName = NSStringFromClass([self.sections[arg2][0] classForCoder]);
        if ([sectionClassName isEqualToString:@"TFNTwitterUser"]) {
          return 0;
        }
      }
      return %orig;
    }
  %end


/// Fix Twitter Login KeyChain
/// Credit goes to @BandarHL (https://twitter.com/bandarhl?s=21) for his code: https://gist.github.com/BandarHL/e99a4ab4afb3f74f29c9525684092563

%hook TFSKeychain
- (NSString *)providerDefaultAccessGroup {
    NSDictionary *query = [NSDictionary dictionaryWithObjectsAndKeys:
                           (__bridge NSString *)kSecClassGenericPassword, (__bridge NSString *)kSecClass,
                           @"bundleSeedID", kSecAttrAccount,
                           @"", kSecAttrService,
                           (id)kCFBooleanTrue, kSecReturnAttributes,
                           nil];
    CFDictionaryRef result = nil;
    OSStatus status = SecItemCopyMatching((__bridge CFDictionaryRef)query, (CFTypeRef *)&result);
    if (status == errSecItemNotFound)
        status = SecItemAdd((__bridge CFDictionaryRef)query, (CFTypeRef *)&result);
        if (status != errSecSuccess)
            return nil;
    NSString *accessGroup = [(__bridge NSDictionary *)result objectForKey:(__bridge NSString *)kSecAttrAccessGroup];

    return accessGroup;
}
- (NSString *)providerSharedAccessGroup {
    NSDictionary *query = [NSDictionary dictionaryWithObjectsAndKeys:
                           (__bridge NSString *)kSecClassGenericPassword, (__bridge NSString *)kSecClass,
                           @"bundleSeedID", kSecAttrAccount,
                           @"", kSecAttrService,
                           (id)kCFBooleanTrue, kSecReturnAttributes,
                           nil];
    CFDictionaryRef result = nil;
    OSStatus status = SecItemCopyMatching((__bridge CFDictionaryRef)query, (CFTypeRef *)&result);
    if (status == errSecItemNotFound)
        status = SecItemAdd((__bridge CFDictionaryRef)query, (CFTypeRef *)&result);
        if (status != errSecSuccess)
            return nil;
    NSString *accessGroup = [(__bridge NSDictionary *)result objectForKey:(__bridge NSString *)kSecAttrAccessGroup];

    return accessGroup;
}
%end

%hook TFSKeychainDefaultTwitterConfiguration
- (NSString *)defaultAccessGroup {
    NSDictionary *query = [NSDictionary dictionaryWithObjectsAndKeys:
                           (__bridge NSString *)kSecClassGenericPassword, (__bridge NSString *)kSecClass,
                           @"bundleSeedID", kSecAttrAccount,
                           @"", kSecAttrService,
                           (id)kCFBooleanTrue, kSecReturnAttributes,
                           nil];
    CFDictionaryRef result = nil;
    OSStatus status = SecItemCopyMatching((__bridge CFDictionaryRef)query, (CFTypeRef *)&result);
    if (status == errSecItemNotFound)
        status = SecItemAdd((__bridge CFDictionaryRef)query, (CFTypeRef *)&result);
        if (status != errSecSuccess)
            return nil;
    NSString *accessGroup = [(__bridge NSDictionary *)result objectForKey:(__bridge NSString *)kSecAttrAccessGroup];

    return accessGroup;
}
- (NSString *)sharedAccessGroup {
    NSDictionary *query = [NSDictionary dictionaryWithObjectsAndKeys:
                           (__bridge NSString *)kSecClassGenericPassword, (__bridge NSString *)kSecClass,
                           @"bundleSeedID", kSecAttrAccount,
                           @"", kSecAttrService,
                           (id)kCFBooleanTrue, kSecReturnAttributes,
                           nil];
    CFDictionaryRef result = nil;
    OSStatus status = SecItemCopyMatching((__bridge CFDictionaryRef)query, (CFTypeRef *)&result);
    if (status == errSecItemNotFound)
        status = SecItemAdd((__bridge CFDictionaryRef)query, (CFTypeRef *)&result);
        if (status != errSecSuccess)
            return nil;
    NSString *accessGroup = [(__bridge NSDictionary *)result objectForKey:(__bridge NSString *)kSecAttrAccessGroup];

    return accessGroup;
}
%end


///%ctor {
///  %init(RicoTest);
///  %init(NewsFeedAndPosts);
///}