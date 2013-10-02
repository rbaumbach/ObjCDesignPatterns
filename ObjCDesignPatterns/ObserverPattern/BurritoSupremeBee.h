#import "Observer.h"
#import "NewsReporter.h"


@interface BurritoSupremeBee : NSObject <Observer>

@property (strong, nonatomic) NSString *snippet;

- (id)initWithNewsReporter:(id<NewsReporter>)newsReporter;

@end
