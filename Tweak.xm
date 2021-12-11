#import "Tweak.h"

BOOL noads = YES;
BOOL hideNewsAndTrending = YES;
BOOL hideWhoToFollow = YES;

%group RicoTest
  %hook T1SlideshowViewController
  - (void)imageDisplayView:(id)arg1 didLongPress:(id)arg2 {
      %orig;
  }

  - (void)slideshowSeekController:(id)arg1 didLongPressWithRecognizer:(id)arg2 {
      UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Welcome" message:@"RicoTest!" delegate:nil cancelButtonTitle:@"Thanks" otherButtonTitles:nil];
      [alert show];
      %orig;
  }
  %end
%end

%group NewsFeedAndPosts
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
%end

%ctor {
  %init(RicoTest);
  %init(NewsFeedAndPosts);
}