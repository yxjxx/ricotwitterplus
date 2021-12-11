#line 1 "Tweak.xm"
#import "Tweak.h"

BOOL noads = YES;
BOOL hideNewsAndTrending = YES;
BOOL hideWhoToFollow = YES;



#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class TFSKeychain; @class TFNItemsDataViewController; @class T1SlideshowViewController; @class TFSKeychainDefaultTwitterConfiguration; @class NSBundle; 
static id (*_logos_orig$_ungrouped$NSBundle$objectForInfoDictionaryKey$)(_LOGOS_SELF_TYPE_NORMAL NSBundle* _LOGOS_SELF_CONST, SEL, NSString *); static id _logos_method$_ungrouped$NSBundle$objectForInfoDictionaryKey$(_LOGOS_SELF_TYPE_NORMAL NSBundle* _LOGOS_SELF_CONST, SEL, NSString *); static NSString * (*_logos_orig$_ungrouped$NSBundle$bundleIdentifier)(_LOGOS_SELF_TYPE_NORMAL NSBundle* _LOGOS_SELF_CONST, SEL); static NSString * _logos_method$_ungrouped$NSBundle$bundleIdentifier(_LOGOS_SELF_TYPE_NORMAL NSBundle* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$T1SlideshowViewController$imageDisplayView$didLongPress$)(_LOGOS_SELF_TYPE_NORMAL T1SlideshowViewController* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$_ungrouped$T1SlideshowViewController$imageDisplayView$didLongPress$(_LOGOS_SELF_TYPE_NORMAL T1SlideshowViewController* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$_ungrouped$T1SlideshowViewController$slideshowSeekController$didLongPressWithRecognizer$)(_LOGOS_SELF_TYPE_NORMAL T1SlideshowViewController* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$_ungrouped$T1SlideshowViewController$slideshowSeekController$didLongPressWithRecognizer$(_LOGOS_SELF_TYPE_NORMAL T1SlideshowViewController* _LOGOS_SELF_CONST, SEL, id, id); static id (*_logos_orig$_ungrouped$TFNItemsDataViewController$tableViewCellForItem$atIndexPath$)(_LOGOS_SELF_TYPE_NORMAL TFNItemsDataViewController* _LOGOS_SELF_CONST, SEL, id, id); static id _logos_method$_ungrouped$TFNItemsDataViewController$tableViewCellForItem$atIndexPath$(_LOGOS_SELF_TYPE_NORMAL TFNItemsDataViewController* _LOGOS_SELF_CONST, SEL, id, id); static double (*_logos_orig$_ungrouped$TFNItemsDataViewController$tableView$heightForRowAtIndexPath$)(_LOGOS_SELF_TYPE_NORMAL TFNItemsDataViewController* _LOGOS_SELF_CONST, SEL, id, id); static double _logos_method$_ungrouped$TFNItemsDataViewController$tableView$heightForRowAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL TFNItemsDataViewController* _LOGOS_SELF_CONST, SEL, id, id); static double (*_logos_orig$_ungrouped$TFNItemsDataViewController$tableView$heightForHeaderInSection$)(_LOGOS_SELF_TYPE_NORMAL TFNItemsDataViewController* _LOGOS_SELF_CONST, SEL, id, long long); static double _logos_method$_ungrouped$TFNItemsDataViewController$tableView$heightForHeaderInSection$(_LOGOS_SELF_TYPE_NORMAL TFNItemsDataViewController* _LOGOS_SELF_CONST, SEL, id, long long); static NSString * (*_logos_orig$_ungrouped$TFSKeychain$providerDefaultAccessGroup)(_LOGOS_SELF_TYPE_NORMAL TFSKeychain* _LOGOS_SELF_CONST, SEL); static NSString * _logos_method$_ungrouped$TFSKeychain$providerDefaultAccessGroup(_LOGOS_SELF_TYPE_NORMAL TFSKeychain* _LOGOS_SELF_CONST, SEL); static NSString * (*_logos_orig$_ungrouped$TFSKeychain$providerSharedAccessGroup)(_LOGOS_SELF_TYPE_NORMAL TFSKeychain* _LOGOS_SELF_CONST, SEL); static NSString * _logos_method$_ungrouped$TFSKeychain$providerSharedAccessGroup(_LOGOS_SELF_TYPE_NORMAL TFSKeychain* _LOGOS_SELF_CONST, SEL); static NSString * (*_logos_orig$_ungrouped$TFSKeychainDefaultTwitterConfiguration$defaultAccessGroup)(_LOGOS_SELF_TYPE_NORMAL TFSKeychainDefaultTwitterConfiguration* _LOGOS_SELF_CONST, SEL); static NSString * _logos_method$_ungrouped$TFSKeychainDefaultTwitterConfiguration$defaultAccessGroup(_LOGOS_SELF_TYPE_NORMAL TFSKeychainDefaultTwitterConfiguration* _LOGOS_SELF_CONST, SEL); static NSString * (*_logos_orig$_ungrouped$TFSKeychainDefaultTwitterConfiguration$sharedAccessGroup)(_LOGOS_SELF_TYPE_NORMAL TFSKeychainDefaultTwitterConfiguration* _LOGOS_SELF_CONST, SEL); static NSString * _logos_method$_ungrouped$TFSKeychainDefaultTwitterConfiguration$sharedAccessGroup(_LOGOS_SELF_TYPE_NORMAL TFSKeychainDefaultTwitterConfiguration* _LOGOS_SELF_CONST, SEL); 

#line 8 "Tweak.xm"
  
  static id _logos_method$_ungrouped$NSBundle$objectForInfoDictionaryKey$(_LOGOS_SELF_TYPE_NORMAL NSBundle* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSString * key) { 
      if ([key isEqualToString:@"CFBundleIdentifier"]) {
        return @"com.atebits.Tweetie2";
      } else {
        return _logos_orig$_ungrouped$NSBundle$objectForInfoDictionaryKey$(self, _cmd, key);
      }
  }

  static NSString * _logos_method$_ungrouped$NSBundle$bundleIdentifier(_LOGOS_SELF_TYPE_NORMAL NSBundle* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    if (self != [NSBundle mainBundle]) {
      return _logos_orig$_ungrouped$NSBundle$bundleIdentifier(self, _cmd);
    }    
    return @"com.atebits.Tweetie2";
  }
  

  
  static void _logos_method$_ungrouped$T1SlideshowViewController$imageDisplayView$didLongPress$(_LOGOS_SELF_TYPE_NORMAL T1SlideshowViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {
      _logos_orig$_ungrouped$T1SlideshowViewController$imageDisplayView$didLongPress$(self, _cmd, arg1, arg2);
  }

  static void _logos_method$_ungrouped$T1SlideshowViewController$slideshowSeekController$didLongPressWithRecognizer$(_LOGOS_SELF_TYPE_NORMAL T1SlideshowViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {
      NSString *bid = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIdentifier"];
      UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Welcome" message:bid delegate:nil cancelButtonTitle:@"Thanks" otherButtonTitles:nil];
      [alert show];
      _logos_orig$_ungrouped$T1SlideshowViewController$slideshowSeekController$didLongPressWithRecognizer$(self, _cmd, arg1, arg2);
  }
  



  
    static id _logos_method$_ungrouped$TFNItemsDataViewController$tableViewCellForItem$atIndexPath$(_LOGOS_SELF_TYPE_NORMAL TFNItemsDataViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {
      UITableViewCell *tbvCell = _logos_orig$_ungrouped$TFNItemsDataViewController$tableViewCellForItem$atIndexPath$(self, _cmd, arg1, arg2);
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

    static double _logos_method$_ungrouped$TFNItemsDataViewController$tableView$heightForRowAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL TFNItemsDataViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {
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

      return _logos_orig$_ungrouped$TFNItemsDataViewController$tableView$heightForRowAtIndexPath$(self, _cmd, arg1, arg2);
    }

    static double _logos_method$_ungrouped$TFNItemsDataViewController$tableView$heightForHeaderInSection$(_LOGOS_SELF_TYPE_NORMAL TFNItemsDataViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, long long arg2) {
      if (self.sections 
          && self.sections[arg2] 
          && ((NSArray* )self.sections[arg2]).count
          && self.sections[arg2][0]) {
        NSString *sectionClassName = NSStringFromClass([self.sections[arg2][0] classForCoder]);
        if ([sectionClassName isEqualToString:@"TFNTwitterUser"]) {
          return 0;
        }
      }
      return _logos_orig$_ungrouped$TFNItemsDataViewController$tableView$heightForHeaderInSection$(self, _cmd, arg1, arg2);
    }
  






static NSString * _logos_method$_ungrouped$TFSKeychain$providerDefaultAccessGroup(_LOGOS_SELF_TYPE_NORMAL TFSKeychain* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
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
static NSString * _logos_method$_ungrouped$TFSKeychain$providerSharedAccessGroup(_LOGOS_SELF_TYPE_NORMAL TFSKeychain* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
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



static NSString * _logos_method$_ungrouped$TFSKeychainDefaultTwitterConfiguration$defaultAccessGroup(_LOGOS_SELF_TYPE_NORMAL TFSKeychainDefaultTwitterConfiguration* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
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
static NSString * _logos_method$_ungrouped$TFSKeychainDefaultTwitterConfiguration$sharedAccessGroup(_LOGOS_SELF_TYPE_NORMAL TFSKeychainDefaultTwitterConfiguration* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
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







static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$NSBundle = objc_getClass("NSBundle"); { MSHookMessageEx(_logos_class$_ungrouped$NSBundle, @selector(objectForInfoDictionaryKey:), (IMP)&_logos_method$_ungrouped$NSBundle$objectForInfoDictionaryKey$, (IMP*)&_logos_orig$_ungrouped$NSBundle$objectForInfoDictionaryKey$);}{ MSHookMessageEx(_logos_class$_ungrouped$NSBundle, @selector(bundleIdentifier), (IMP)&_logos_method$_ungrouped$NSBundle$bundleIdentifier, (IMP*)&_logos_orig$_ungrouped$NSBundle$bundleIdentifier);}Class _logos_class$_ungrouped$T1SlideshowViewController = objc_getClass("T1SlideshowViewController"); { MSHookMessageEx(_logos_class$_ungrouped$T1SlideshowViewController, @selector(imageDisplayView:didLongPress:), (IMP)&_logos_method$_ungrouped$T1SlideshowViewController$imageDisplayView$didLongPress$, (IMP*)&_logos_orig$_ungrouped$T1SlideshowViewController$imageDisplayView$didLongPress$);}{ MSHookMessageEx(_logos_class$_ungrouped$T1SlideshowViewController, @selector(slideshowSeekController:didLongPressWithRecognizer:), (IMP)&_logos_method$_ungrouped$T1SlideshowViewController$slideshowSeekController$didLongPressWithRecognizer$, (IMP*)&_logos_orig$_ungrouped$T1SlideshowViewController$slideshowSeekController$didLongPressWithRecognizer$);}Class _logos_class$_ungrouped$TFNItemsDataViewController = objc_getClass("TFNItemsDataViewController"); { MSHookMessageEx(_logos_class$_ungrouped$TFNItemsDataViewController, @selector(tableViewCellForItem:atIndexPath:), (IMP)&_logos_method$_ungrouped$TFNItemsDataViewController$tableViewCellForItem$atIndexPath$, (IMP*)&_logos_orig$_ungrouped$TFNItemsDataViewController$tableViewCellForItem$atIndexPath$);}{ MSHookMessageEx(_logos_class$_ungrouped$TFNItemsDataViewController, @selector(tableView:heightForRowAtIndexPath:), (IMP)&_logos_method$_ungrouped$TFNItemsDataViewController$tableView$heightForRowAtIndexPath$, (IMP*)&_logos_orig$_ungrouped$TFNItemsDataViewController$tableView$heightForRowAtIndexPath$);}{ MSHookMessageEx(_logos_class$_ungrouped$TFNItemsDataViewController, @selector(tableView:heightForHeaderInSection:), (IMP)&_logos_method$_ungrouped$TFNItemsDataViewController$tableView$heightForHeaderInSection$, (IMP*)&_logos_orig$_ungrouped$TFNItemsDataViewController$tableView$heightForHeaderInSection$);}Class _logos_class$_ungrouped$TFSKeychain = objc_getClass("TFSKeychain"); { MSHookMessageEx(_logos_class$_ungrouped$TFSKeychain, @selector(providerDefaultAccessGroup), (IMP)&_logos_method$_ungrouped$TFSKeychain$providerDefaultAccessGroup, (IMP*)&_logos_orig$_ungrouped$TFSKeychain$providerDefaultAccessGroup);}{ MSHookMessageEx(_logos_class$_ungrouped$TFSKeychain, @selector(providerSharedAccessGroup), (IMP)&_logos_method$_ungrouped$TFSKeychain$providerSharedAccessGroup, (IMP*)&_logos_orig$_ungrouped$TFSKeychain$providerSharedAccessGroup);}Class _logos_class$_ungrouped$TFSKeychainDefaultTwitterConfiguration = objc_getClass("TFSKeychainDefaultTwitterConfiguration"); { MSHookMessageEx(_logos_class$_ungrouped$TFSKeychainDefaultTwitterConfiguration, @selector(defaultAccessGroup), (IMP)&_logos_method$_ungrouped$TFSKeychainDefaultTwitterConfiguration$defaultAccessGroup, (IMP*)&_logos_orig$_ungrouped$TFSKeychainDefaultTwitterConfiguration$defaultAccessGroup);}{ MSHookMessageEx(_logos_class$_ungrouped$TFSKeychainDefaultTwitterConfiguration, @selector(sharedAccessGroup), (IMP)&_logos_method$_ungrouped$TFSKeychainDefaultTwitterConfiguration$sharedAccessGroup, (IMP*)&_logos_orig$_ungrouped$TFSKeychainDefaultTwitterConfiguration$sharedAccessGroup);}} }
#line 242 "Tweak.xm"
