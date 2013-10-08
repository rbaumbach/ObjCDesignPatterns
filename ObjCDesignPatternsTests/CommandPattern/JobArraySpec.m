#import "Kiwi.h"
#import "JobArray.h"
#import "Job.h"


@interface JobArray ()

@property (strong, nonatomic) NSMutableArray *jobs;

- (NSArray *)setupQueue;

@end


SPEC_BEGIN(JobArraySpec)

describe(@"JobArray", ^{
    __block JobArray *jobArray;
    
    beforeEach(^{
        jobArray = [[JobArray alloc] init];
    });
    
    it(@"is not nil", ^{
        [jobArray shouldNotBeNil];
    });
    
    it(@"has a job queue 3 element array with null values", ^{
        [[jobArray.jobs[0] should] equal:[NSNull null]];
        [[jobArray.jobs[1] should] equal:[NSNull null]];
        [[jobArray.jobs[2] should] equal:[NSNull null]];
    });
    
    context(@"#addJob:", ^{
        __block id<Job> fakeJob;
        
        beforeEach(^{
            fakeJob = [KWMock mockForProtocol:@protocol(Job)];
            [jobArray addJob:fakeJob atIndex:0];
        });
        
        it(@"adds the job to the job queue", ^{
            [[jobArray.jobs[0] should] equal:fakeJob];
        });
    });

    context(@"#runJob", ^{
        __block NSString *jobResult;
        __block id<Job> firstJob;
        
        beforeEach(^{
            firstJob = [KWMock mockForProtocol:@protocol(Job)];
            id<Job> secondJob = [KWMock mockForProtocol:@protocol(Job)];
            jobArray.jobs = [@[firstJob, secondJob] mutableCopy];
        });
        
        it(@"executes job at index passed in", ^{
            [[jobArray.jobs[0] should] receive:@selector(execute) andReturn:@"First Job Run"];
            jobResult = [jobArray runJobAtIndex:0];
            [[jobResult should] equal:@"First Job Run"];
        });
    });
});

SPEC_END