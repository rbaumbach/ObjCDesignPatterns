#import "Job.h"


@interface JobArray : NSObject

- (void)addJob:(id<Job>)job
       atIndex:(NSInteger)index;

- (NSString *)runJobAtIndex:(NSInteger)index;

@end
