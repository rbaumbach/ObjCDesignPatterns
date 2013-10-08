#import "JobArray.h"


@interface JobArray ()

@property (strong, nonatomic) NSMutableArray *jobs;

@end


@implementation JobArray

#pragma mark - Init Methods

- (id)init
{
    self = [super init];
    if (self) {
        self.jobs = [@[[NSNull null], [NSNull null], [NSNull null]] mutableCopy];
    }
    return self;
}

#pragma mark - Public Methods

- (void)addJob:(id<Job>)job
       atIndex:(NSInteger)index
{
    self.jobs[index] = job;
}

- (NSString *)runJobAtIndex:(NSInteger)index
{
    return [self.jobs[index] execute];
}

@end
