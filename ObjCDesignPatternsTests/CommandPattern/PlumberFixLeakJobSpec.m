#import "Kiwi.h"
#import "PlumberFixLeakJob.h"
#import "Plumber.h"
#import "Job.h"


@interface PlumberFixLeakJob ()

@property (strong, nonatomic) Plumber *plumber;

@end


SPEC_BEGIN(PlumberFixLeakJobSpec)

describe(@"PlumberFixLeakJob", ^{
    __block PlumberFixLeakJob *job;
    __block Plumber *fakePlumber;
    
    beforeEach(^{
        fakePlumber = [Plumber mock];
        job = [[PlumberFixLeakJob alloc] initWithPlumber:fakePlumber];
    });
    
    it(@"is not nil", ^{
        [job shouldNotBeNil];
    });
    
    it(@"conforms to <Job>", ^{
        [[job should] conformToProtocol:@protocol(Job)];
    });
    
    it(@"has a plumber", ^{
        [[job.plumber should] equal:fakePlumber];
    });
    
    context(@"#execute", ^{
        it(@"executes [plumber fixLeak]", ^{
            [[job.plumber should] receive:@selector(fixLeak) andReturn:@"fixLeak"];
            NSString *jobResult = [job execute];
            [[jobResult should] equal:@"fixLeak"];
        });
    });
});

SPEC_END