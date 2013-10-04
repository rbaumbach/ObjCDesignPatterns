#import "Job.h"
#import "Exterminator.h"

@interface ExterminatorKillRoachesJob : NSObject <Job>

- (id)initWithExterminator:(Exterminator *)exterminator;

@end
