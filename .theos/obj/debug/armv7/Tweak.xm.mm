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

@class T1SlideshowViewController; @class TFNItemsDataViewController; 


#line 7 "Tweak.xm"
static void (*_logos_orig$RicoTest$T1SlideshowViewController$imageDisplayView$didLongPress$)(_LOGOS_SELF_TYPE_NORMAL T1SlideshowViewController* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$RicoTest$T1SlideshowViewController$imageDisplayView$didLongPress$(_LOGOS_SELF_TYPE_NORMAL T1SlideshowViewController* _LOGOS_SELF_CONST, SEL, id, id); static void (*_logos_orig$RicoTest$T1SlideshowViewController$slideshowSeekController$didLongPressWithRecognizer$)(_LOGOS_SELF_TYPE_NORMAL T1SlideshowViewController* _LOGOS_SELF_CONST, SEL, id, id); static void _logos_method$RicoTest$T1SlideshowViewController$slideshowSeekController$didLongPressWithRecognizer$(_LOGOS_SELF_TYPE_NORMAL T1SlideshowViewController* _LOGOS_SELF_CONST, SEL, id, id); 
  
  static void _logos_method$RicoTest$T1SlideshowViewController$imageDisplayView$didLongPress$(_LOGOS_SELF_TYPE_NORMAL T1SlideshowViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {
      _logos_orig$RicoTest$T1SlideshowViewController$imageDisplayView$didLongPress$(self, _cmd, arg1, arg2);
  }

  static void _logos_method$RicoTest$T1SlideshowViewController$slideshowSeekController$didLongPressWithRecognizer$(_LOGOS_SELF_TYPE_NORMAL T1SlideshowViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {
      UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Welcome" message:@"RicoTest!" delegate:nil cancelButtonTitle:@"Thanks" otherButtonTitles:nil];
      [alert show];
      _logos_orig$RicoTest$T1SlideshowViewController$slideshowSeekController$didLongPressWithRecognizer$(self, _cmd, arg1, arg2);
  }
  


static id (*_logos_orig$NewsFeedAndPosts$TFNItemsDataViewController$tableViewCellForItem$atIndexPath$)(_LOGOS_SELF_TYPE_NORMAL TFNItemsDataViewController* _LOGOS_SELF_CONST, SEL, id, id); static id _logos_method$NewsFeedAndPosts$TFNItemsDataViewController$tableViewCellForItem$atIndexPath$(_LOGOS_SELF_TYPE_NORMAL TFNItemsDataViewController* _LOGOS_SELF_CONST, SEL, id, id); static double (*_logos_orig$NewsFeedAndPosts$TFNItemsDataViewController$tableView$heightForRowAtIndexPath$)(_LOGOS_SELF_TYPE_NORMAL TFNItemsDataViewController* _LOGOS_SELF_CONST, SEL, id, id); static double _logos_method$NewsFeedAndPosts$TFNItemsDataViewController$tableView$heightForRowAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL TFNItemsDataViewController* _LOGOS_SELF_CONST, SEL, id, id); static double (*_logos_orig$NewsFeedAndPosts$TFNItemsDataViewController$tableView$heightForHeaderInSection$)(_LOGOS_SELF_TYPE_NORMAL TFNItemsDataViewController* _LOGOS_SELF_CONST, SEL, id, long long); static double _logos_method$NewsFeedAndPosts$TFNItemsDataViewController$tableView$heightForHeaderInSection$(_LOGOS_SELF_TYPE_NORMAL TFNItemsDataViewController* _LOGOS_SELF_CONST, SEL, id, long long); 
  
    static id _logos_method$NewsFeedAndPosts$TFNItemsDataViewController$tableViewCellForItem$atIndexPath$(_LOGOS_SELF_TYPE_NORMAL TFNItemsDataViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {
      UITableViewCell *tbvCell = _logos_orig$NewsFeedAndPosts$TFNItemsDataViewController$tableViewCellForItem$atIndexPath$(self, _cmd, arg1, arg2);
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

    static double _logos_method$NewsFeedAndPosts$TFNItemsDataViewController$tableView$heightForRowAtIndexPath$(_LOGOS_SELF_TYPE_NORMAL TFNItemsDataViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2) {
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

      return _logos_orig$NewsFeedAndPosts$TFNItemsDataViewController$tableView$heightForRowAtIndexPath$(self, _cmd, arg1, arg2);
    }

    static double _logos_method$NewsFeedAndPosts$TFNItemsDataViewController$tableView$heightForHeaderInSection$(_LOGOS_SELF_TYPE_NORMAL TFNItemsDataViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, long long arg2) {
      if (self.sections 
          && self.sections[arg2] 
          && ((NSArray* )self.sections[arg2]).count
          && self.sections[arg2][0]) {
        NSString *sectionClassName = NSStringFromClass([self.sections[arg2][0] classForCoder]);
        if ([sectionClassName isEqualToString:@"TFNTwitterUser"]) {
          return 0;
        }
      }
      return _logos_orig$NewsFeedAndPosts$TFNItemsDataViewController$tableView$heightForHeaderInSection$(self, _cmd, arg1, arg2);
    }
  


static __attribute__((constructor)) void _logosLocalCtor_fcb669a7(int __unused argc, char __unused **argv, char __unused **envp) {
  {Class _logos_class$RicoTest$T1SlideshowViewController = objc_getClass("T1SlideshowViewController"); { MSHookMessageEx(_logos_class$RicoTest$T1SlideshowViewController, @selector(imageDisplayView:didLongPress:), (IMP)&_logos_method$RicoTest$T1SlideshowViewController$imageDisplayView$didLongPress$, (IMP*)&_logos_orig$RicoTest$T1SlideshowViewController$imageDisplayView$didLongPress$);}{ MSHookMessageEx(_logos_class$RicoTest$T1SlideshowViewController, @selector(slideshowSeekController:didLongPressWithRecognizer:), (IMP)&_logos_method$RicoTest$T1SlideshowViewController$slideshowSeekController$didLongPressWithRecognizer$, (IMP*)&_logos_orig$RicoTest$T1SlideshowViewController$slideshowSeekController$didLongPressWithRecognizer$);}}
  {Class _logos_class$NewsFeedAndPosts$TFNItemsDataViewController = objc_getClass("TFNItemsDataViewController"); { MSHookMessageEx(_logos_class$NewsFeedAndPosts$TFNItemsDataViewController, @selector(tableViewCellForItem:atIndexPath:), (IMP)&_logos_method$NewsFeedAndPosts$TFNItemsDataViewController$tableViewCellForItem$atIndexPath$, (IMP*)&_logos_orig$NewsFeedAndPosts$TFNItemsDataViewController$tableViewCellForItem$atIndexPath$);}{ MSHookMessageEx(_logos_class$NewsFeedAndPosts$TFNItemsDataViewController, @selector(tableView:heightForRowAtIndexPath:), (IMP)&_logos_method$NewsFeedAndPosts$TFNItemsDataViewController$tableView$heightForRowAtIndexPath$, (IMP*)&_logos_orig$NewsFeedAndPosts$TFNItemsDataViewController$tableView$heightForRowAtIndexPath$);}{ MSHookMessageEx(_logos_class$NewsFeedAndPosts$TFNItemsDataViewController, @selector(tableView:heightForHeaderInSection:), (IMP)&_logos_method$NewsFeedAndPosts$TFNItemsDataViewController$tableView$heightForHeaderInSection$, (IMP*)&_logos_orig$NewsFeedAndPosts$TFNItemsDataViewController$tableView$heightForHeaderInSection$);}}
}
