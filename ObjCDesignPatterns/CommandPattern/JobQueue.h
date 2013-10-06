#import "Job.h"


@interface JobQueue : NSObject

- (void)addJob:(id<Job>)job
       atIndex:(NSInteger)index;

- (NSString *)runJobAtIndex:(NSInteger)index;

@end
