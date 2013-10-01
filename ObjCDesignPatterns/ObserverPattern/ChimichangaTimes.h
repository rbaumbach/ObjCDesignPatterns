#import "Observer.h"
#import "NewsReporter.h"


@interface ChimichangaTimes : NSObject <Observer>

- (id)initWithNewsReporter:(id<NewsReporter>)newsReporter;

@end
