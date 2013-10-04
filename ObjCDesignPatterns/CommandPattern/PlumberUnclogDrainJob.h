#import "Plumber.h"
#import "Job.h"


@interface PlumberUnclogDrainJob : NSObject <Job>

- (id)initWithPlumber:(Plumber *)plumber;

@end
