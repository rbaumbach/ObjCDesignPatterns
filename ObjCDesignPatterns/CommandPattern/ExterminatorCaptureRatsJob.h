#import "Job.h"
#import "Exterminator.h"


@interface ExterminatorCaptureRatsJob : NSObject <Job>

- (id)initWithExterminator:(Exterminator *)exterminator;

@end
