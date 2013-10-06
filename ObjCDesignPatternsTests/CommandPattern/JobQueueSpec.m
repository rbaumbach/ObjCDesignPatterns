#import "Kiwi.h"
#import "JobQueue.h"
#import "Job.h"


@interface JobQueue ()

@property (strong, nonatomic) NSMutableArray *jobs;

- (NSArray *)setupQueue;

@end


SPEC_BEGIN(JobQueueSpec)

describe(@"JobQueue", ^{
    __block JobQueue *jobQueue;
    
    beforeEach(^{
        jobQueue = [[JobQueue alloc] init];
    });
    
    it(@"is not nil", ^{
        [jobQueue shouldNotBeNil];
    });
    
    it(@"has a job queue 3 element array with null values", ^{
        [[jobQueue.jobs[0] should] equal:[NSNull null]];
        [[jobQueue.jobs[1] should] equal:[NSNull null]];
        [[jobQueue.jobs[2] should] equal:[NSNull null]];
    });
    
    context(@"#addJob:", ^{
        __block id<Job> fakeJob;
        
        beforeEach(^{
            fakeJob = [KWMock mockForProtocol:@protocol(Job)];
            [jobQueue addJob:fakeJob atIndex:0];
        });
        
        it(@"adds the job to the job queue", ^{
            [[jobQueue.jobs[0] should] equal:fakeJob];
        });
    });

    context(@"#runJob", ^{
        __block NSString *jobResult;
        __block id<Job> firstJob;
        
        beforeEach(^{
            firstJob = [KWMock mockForProtocol:@protocol(Job)];
            id<Job> secondJob = [KWMock mockForProtocol:@protocol(Job)];
            jobQueue.jobs = [@[firstJob, secondJob] mutableCopy];
        });
        
        it(@"executes job at index passed in", ^{
            [[jobQueue.jobs[0] should] receive:@selector(execute) andReturn:@"First Job Run"];
            jobResult = [jobQueue runJobAtIndex:0];
            [[jobResult should] equal:@"First Job Run"];
        });
    });
});

SPEC_END