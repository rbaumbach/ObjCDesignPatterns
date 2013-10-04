#import "Kiwi.h"
#import "ExterminatorCaptureRatsJob.h"
#import "Exterminator.h"
#import "Job.h"


@interface ExterminatorCaptureRatsJob ()

@property (strong, nonatomic) Exterminator *exterminator;

@end


SPEC_BEGIN(ExterminatorCaptureRatsJobSpec)

describe(@"ExterminatorCaptureRatsJob", ^{
    __block ExterminatorCaptureRatsJob *job;
    __block Exterminator *fakeExterminator;
    
    beforeEach(^{
        fakeExterminator = [Exterminator mock];
        job = [[ExterminatorCaptureRatsJob alloc] initWithExterminator:fakeExterminator];
    });
    
    it(@"is not nil", ^{
        [job shouldNotBeNil];
    });
    
    it(@"conforms to <Job>", ^{
        [[job should] conformToProtocol:@protocol(Job)];
    });
    
    it(@"has a plumber", ^{
        [[job.exterminator should] equal:fakeExterminator];
    });
    
    context(@"#execute", ^{
        it(@"executes [exterminator captureRats]", ^{
            [[job.exterminator should] receive:@selector(captureRats) andReturn:@"captureRats"];
            NSString *jobResult = [job execute];
            [[jobResult should] equal:@"captureRats"];
        });
    });
});

SPEC_END