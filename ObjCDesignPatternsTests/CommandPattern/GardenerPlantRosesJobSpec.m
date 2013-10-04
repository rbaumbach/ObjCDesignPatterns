#import "Kiwi.h"
#import "GardenerPlantRosesJob.h"
#import "Gardener.h"
#import "Job.h"


@interface GardenerPlantRosesJob ()

@property (strong, nonatomic) Gardener *gardener;

@end


SPEC_BEGIN(GardenerPlantRosesJobSpec)

describe(@"GardenerPlantRosesJob", ^{
    __block GardenerPlantRosesJob *job;
    __block Gardener *fakeGardener;
    
    beforeEach(^{
        fakeGardener = [Gardener mock];
        job = [[GardenerPlantRosesJob alloc] initWithGardener:fakeGardener];
    });
    
    it(@"is not nil", ^{
        [job shouldNotBeNil];
    });
    
    it(@"conforms to <Job>", ^{
        [[job should] conformToProtocol:@protocol(Job)];
    });
    
    it(@"has a plumber", ^{
        [[job.gardener should] equal:fakeGardener];
    });
    
    context(@"#execute", ^{
        it(@"executes [gardener plantRoses]", ^{
            [[job.gardener should] receive:@selector(plantRoses) andReturn:@"plantRoses"];
            NSString *jobResult = [job execute];
            [[jobResult should] equal:@"plantRoses"];
        });
    });
});

SPEC_END