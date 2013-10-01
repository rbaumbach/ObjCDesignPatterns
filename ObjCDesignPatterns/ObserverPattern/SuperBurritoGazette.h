#import "Observer.h"
#import "NewsReporter.h"

@interface SuperBurritoGazette : NSObject <Observer>

- (id)initWithNewsReporter:(id<NewsReporter>)newsReporter;

@end
