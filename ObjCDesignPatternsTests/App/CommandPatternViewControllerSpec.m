#import "Kiwi.h"
#import "Swizzlean.h"
#import "CommandPatternViewController.h"
#import "JobArray.h"
#import "PlumberUnclogDrainJob.h"
#import "ExterminatorKillRoachesJob.h"
#import "GardenerTrimBushesJob.h"

@interface CommandPatternViewController ()

@property (strong, nonatomic) JobArray *jobArray;
@property (strong, nonatomic) Plumber *plumber;
@property (strong, nonatomic) Exterminator *exterminator;
@property (strong, nonatomic) Gardener *gardener;

- (void)setupTextView;

@end


SPEC_BEGIN(CommandPatternViewControllerSpec)

describe(@"CommandPatternViewController", ^{
    __block CommandPatternViewController *controller;
    
    beforeEach(^{
        controller = [[CommandPatternViewController alloc] init];
        [controller view];
    });
    
    it(@"should not be nil", ^{
        [controller shouldNotBeNil];
    });
    
    it(@"is a subclass of UIViewController", ^{
        [[controller should] beKindOfClass:[UIViewController class]];
    });
    
    it(@"has correct title", ^{
        [[controller.title should] equal:@"Command Pattern"];
    });
    
    it(@"has a job array", ^{
        [controller.jobArray shouldNotBeNil];
    });
    
    it(@"has a plumber", ^{
        [controller.plumber shouldNotBeNil];
    });
    
    it(@"has an exterminator", ^{
        [controller.exterminator shouldNotBeNil];
    });
    
    it(@"has a gardener", ^{
        [controller.gardener shouldNotBeNil];
    });

    context(@"textView", ^{
        it(@"has a textView", ^{
            [controller.textView shouldNotBeNil];
        });
        
        it(@"cannot be edited", ^{
            [[theValue(controller.textView.editable) should] beNo];
        });
    });
    
    context(@"#viewDidLoad", ^{
        __block Swizzlean *superViewDidLoadSwizz;
        __block BOOL superViewDidLoadCalled;
        
        beforeEach(^{
            superViewDidLoadCalled = NO;
            superViewDidLoadSwizz = [[Swizzlean alloc] initWithClassToSwizzle:[UIViewController class]];
            [superViewDidLoadSwizz swizzleInstanceMethod:@selector(viewDidLoad) withReplacementImplementation:^(id _self) {
                superViewDidLoadCalled = YES;
            }];
        });
        
        afterEach(^{
            [superViewDidLoadSwizz resetSwizzledInstanceMethod];
        });
        
        it(@"calls super, thanks for asking", ^{
            [controller viewDidLoad];
            [[theValue(superViewDidLoadCalled) should] beYes];
        });
        
        it(@"calls setupTextView", ^{
            [[controller should] receive:@selector(setupTextView)];
            [controller viewDidLoad];
        });
    });
    
    context(@"#setupTextView", ^{
        __block Swizzlean *unclogDrainJobSwizz;
        __block Swizzlean *killRoachesJobSwizz;
        __block Swizzlean *trimBushesJobSwizz;
        
        __block Plumber *retPlumber;
        __block Exterminator *retExterminator;
        __block Gardener *retGardener;
        
        __block PlumberUnclogDrainJob *fakeUnclogDrainJob;
        __block ExterminatorKillRoachesJob *fakeKillRoachesJob;
        __block GardenerTrimBushesJob *fakeTrimBushesJob;
        
        beforeEach(^{
            fakeUnclogDrainJob = [PlumberUnclogDrainJob mock];
            unclogDrainJobSwizz = [[Swizzlean alloc] initWithClassToSwizzle:[PlumberUnclogDrainJob class]];
            [unclogDrainJobSwizz swizzleInstanceMethod:@selector(initWithPlumber:)
                         withReplacementImplementation:^(id _self, Plumber *plumberParam) {
                             retPlumber = plumberParam;
                             return fakeUnclogDrainJob;
            }];
            
            fakeKillRoachesJob = [ExterminatorKillRoachesJob mock];
            killRoachesJobSwizz = [[Swizzlean alloc] initWithClassToSwizzle:[ExterminatorKillRoachesJob class]];
            [killRoachesJobSwizz swizzleInstanceMethod:@selector(initWithExterminator:)
                         withReplacementImplementation:^(id _self, Exterminator *exterminatorParam) {
                             retExterminator = exterminatorParam;
                             return fakeKillRoachesJob;
                         }];
            
            fakeTrimBushesJob = [GardenerTrimBushesJob mock];
            trimBushesJobSwizz = [[Swizzlean alloc] initWithClassToSwizzle:[GardenerTrimBushesJob class]];
            [trimBushesJobSwizz swizzleInstanceMethod:@selector(initWithGardener:)
                        withReplacementImplementation:^(id _self, Gardener *gardenerParam) {
                             retGardener = gardenerParam;
                             return fakeTrimBushesJob;
                         }];
            
            [[controller.jobArray should] receive:@selector(addJob:atIndex:)
                                    withArguments:fakeUnclogDrainJob, theValue(0)];
            [[controller.jobArray should] receive:@selector(addJob:atIndex:)
                                    withArguments:fakeKillRoachesJob, theValue(1)];
            [[controller.jobArray should] receive:@selector(addJob:atIndex:)
                                    withArguments:fakeTrimBushesJob, theValue(2)];
            
            [[controller.jobArray should] receive:@selector(runJobAtIndex:)
                                        andReturn:@"job1"
                                    withArguments:theValue(0)];
            [[controller.jobArray should] receive:@selector(runJobAtIndex:)
                                        andReturn:@"job2"
                                    withArguments:theValue(1)];
            [[controller.jobArray should] receive:@selector(runJobAtIndex:)
                                        andReturn:@"job3"
                                    withArguments:theValue(2)];
            [controller setupTextView];
        });
        
        afterEach(^{
            [unclogDrainJobSwizz resetSwizzledInstanceMethod];
            [killRoachesJobSwizz resetSwizzledInstanceMethod];
            [trimBushesJobSwizz resetSwizzledInstanceMethod];
        });
        
        it(@"sets up the textView", ^{
            NSString *expectedText = @"Creating plumber unclog drain job...\nCreating exterminator kill roaches job...\nCreating gardener trim bushes job...\nAdding jobs to job array...\nExecuting jobs...\njob1\njob2\njob3\n";
            [[controller.textView.text should] equal:expectedText];
            
            [[retPlumber should] equal:controller.plumber];
            [[retExterminator should] equal:controller.exterminator];
            [[retGardener should] equal:controller.gardener];
        });
    });
});

SPEC_END