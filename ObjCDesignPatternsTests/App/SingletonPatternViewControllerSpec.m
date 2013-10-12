#import "Kiwi.h"
#import "Swizzlean.h"
#import "SingletonPatternViewController.h"
#import "FancyLookupTable.h"


@interface SingletonPatternViewController ()

@property (strong, nonatomic) FancyLookupTable *fancyLookupTable;

- (void)setupTextView;

@end


SPEC_BEGIN(SingletonPatternViewControllerSpec)

describe(@"SingletonPatternViewController", ^{
    __block SingletonPatternViewController *controller;
    
    beforeEach(^{
        controller = [[SingletonPatternViewController alloc] init];
        [controller view];
    });
    
    it(@"should not be nil", ^{
        [controller shouldNotBeNil];
    });
    
    it(@"is a subclass of UIViewController", ^{
        [[controller should] beKindOfClass:[UIViewController class]];
    });

    it(@"has correct title", ^{
        [[controller.title should] equal:@"Singleton Pattern"];
    });

    it(@"has instance of FancyLookpTable", ^{
        [controller.fancyLookupTable shouldNotBeNil];
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
        __block NSString *singletonReference;
        __block NSString *textViewText;
        
        beforeEach(^{
            singletonReference = [NSString stringWithFormat:@"%@", controller.fancyLookupTable];
            textViewText = [NSString stringWithFormat:@"FancyLookupTable singleton created\nObject reference is: %@\nAttempting new instance...\nObject reference is still: %@\nGetting fancy goblet: platinum goblet\nAdding a fancy dog...\nGold Dog added!\n", singletonReference, singletonReference];
            [controller setupTextView];
        });
        
        it(@"sets up the textView with the correct text ", ^{
            [[controller.textView.text should] equal:textViewText];
        });
    });
});

SPEC_END