#import "Kiwi.h"
#import "GardenerTrimBushesJob.h"
#import "Gardener.h"
#import "Job.h"


@interface GardenerTrimBushesJob ()

@property (strong, nonatomic) Gardener *gardener;

@end


SPEC_BEGIN(GardenerTrimBushesJobSpec)

describe(@"GardenerTrimBushesJob", ^{
    __block GardenerTrimBushesJob *job;
    __block Gardener *fakeGardener;
    
    beforeEach(^{
        fakeGardener = [Gardener mock];
        job = [[GardenerTrimBushesJob alloc] initWithGardener:fakeGardener];
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
        it(@"executes [gardener trimBushes]", ^{
            [[job.gardener should] receive:@selector(trimBushes) andReturn:@"trimBushes"];
            NSString *jobResult = [job execute];
            [[jobResult should] equal:@"trimBushes"];
        });
    });
});

SPEC_END