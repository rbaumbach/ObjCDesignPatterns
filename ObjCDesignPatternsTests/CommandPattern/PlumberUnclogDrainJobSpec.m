#import "Kiwi.h"
#import "PlumberUnclogDrainJob.h"
#import "Plumber.h"
#import "Job.h"


@interface PlumberUnclogDrainJob ()

@property (strong, nonatomic) Plumber *plumber;

@end


SPEC_BEGIN(PlumberUnclogDrainJobSpec)

describe(@"PlumberUnclogDrainJob", ^{
    __block PlumberUnclogDrainJob *job;
    __block Plumber *fakePlumber;
    
    beforeEach(^{
        fakePlumber = [Plumber mock];
        job = [[PlumberUnclogDrainJob alloc] initWithPlumber:fakePlumber];
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
        it(@"executes [plumber unclogDrain]", ^{
            [[job.plumber should] receive:@selector(unclogDrain) andReturn:@"unclogDrain"];
            NSString *jobResult = [job execute];
            [[jobResult should] equal:@"unclogDrain"];
        });
    });
});

SPEC_END