#import "Job.h"
#import "Plumber.h"

@interface PlumberFixLeakJob : NSObject <Job>

- (id)initWithPlumber:(Plumber *)plumber;

@end
