#import "Job.h"
#import "Gardener.h"

@interface GardenerTrimBushesJob : NSObject <Job>

- (id)initWithGardener:(Gardener *)gardener;

@end
