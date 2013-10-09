#import <UIKit/UIKit.h>
#import "FancyMutableArrayDelegate.h"


@interface DelegatePatternViewController : UIViewController <FancyMutableArrayDelegate>

@property (weak, nonatomic) IBOutlet UITextView *textView;

@end
