#import "Duck.h"
#import "Rat.h"

@interface RatAdapter : NSObject <Duck>

- (id)initWithRat:(id<Rat>)rat;

@end
