#import "Observer.h"
#import "NewsReporter.h"


@interface BurritoSupremeBee : NSObject <Observer>

- (id)initWithNewsReporter:(id<NewsReporter>)newsReporter;

@end
