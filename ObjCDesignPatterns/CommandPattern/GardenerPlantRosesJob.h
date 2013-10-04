#import "Gardener.h"
#import "Job.h"


@interface GardenerPlantRosesJob : NSObject <Job>

- (id)initWithGardener:(Gardener *)gardener;

@end
