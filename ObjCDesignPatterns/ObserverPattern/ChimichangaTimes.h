#import "Observer.h"
#import "NewsReporter.h"


@interface ChimichangaTimes : NSObject <Observer>

@property (strong, nonatomic) NSString *snippet;

- (id)initWithNewsReporter:(id<NewsReporter>)newsReporter;

@end
