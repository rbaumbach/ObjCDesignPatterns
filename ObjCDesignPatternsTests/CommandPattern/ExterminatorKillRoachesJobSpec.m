#import "Kiwi.h"
#import "ExterminatorKillRoachesJob.h"
#import "Exterminator.h"
#import "Job.h"


@interface ExterminatorKillRoachesJob ()

@property (strong, nonatomic) Exterminator *exterminator;

@end


SPEC_BEGIN(ExterminatorKillRoachesJobSpec)

describe(@"ExterminatorKillRoachesJob", ^{
    __block ExterminatorKillRoachesJob *job;
    __block Exterminator *fakeExterminator;
    
    beforeEach(^{
        fakeExterminator = [Exterminator mock];
        job = [[ExterminatorKillRoachesJob alloc] initWithExterminator:fakeExterminator];
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
        it(@"executes [exterminator killRoaches]", ^{
            [[job.exterminator should] receive:@selector(killRoaches) andReturn:@"killRoaches"];
            NSString *jobResult = [job execute];
            [[jobResult should] equal:@"killRoaches"];
        });
    });
});

SPEC_END