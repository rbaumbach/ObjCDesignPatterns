#import "Observer.h"
#import "NewsReporter.h"


@interface SuperBurritoGazette : NSObject <Observer>

@property (strong, nonatomic) NSString *snippet;

- (id)initWithNewsReporter:(id<NewsReporter>)newsReporter;

@end
