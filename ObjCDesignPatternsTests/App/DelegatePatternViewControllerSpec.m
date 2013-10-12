#import "Kiwi.h"
#import "Swizzlean.h"
#import "DelegatePatternViewController.h"
#import "FancyMutableArray.h"
#import "FancyMutableArrayDelegate.h"

@interface DelegatePatternViewController ()

@property (strong, nonatomic) FancyMutableArray *fancyMutableArray;
@property (strong, nonatomic) NSString *addedItem;
@property (strong, nonatomic) NSString *replacedItem;
@property (strong, nonatomic) NSString *removedItem;
@property (nonatomic) int replacedItemIndex;
@property (nonatomic) int removedItemIndex;

- (void)setupTextView;

@end


SPEC_BEGIN(DelegatePatternViewControllerSpec)

describe(@"DelegatePatternViewController", ^{
    __block DelegatePatternViewController *controller;
    
    beforeEach(^{
        controller = [[DelegatePatternViewController alloc] init];
        [controller view];
    });
    
    it(@"should not be nil", ^{
        [controller shouldNotBeNil];
    });
    
    it(@"is a subclass of UIViewController", ^{
        [[controller should] beKindOfClass:[UIViewController class]];
    });
    
    it(@"conforms to <FancyMutableArrayDelegate>", ^{
        [[(NSObject *)controller should] conformToProtocol:@protocol(FancyMutableArrayDelegate)];
    });
    
    it(@"has correct title", ^{
        [[controller.title should] equal:@"Delegate Pattern"];
    });

    it(@"has a FancyMutableArray", ^{
        [controller.fancyMutableArray shouldNotBeNil];
    });
    
    it(@"is the delegate for the FancyMutableArray", ^{
        [[(NSObject *)controller.fancyMutableArray.delegate should] equal:controller];
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
    
    context(@"<FancyMutableArrayDelegate>", ^{
        context(@"#didAddItem:", ^{
            it(@"sets addedItem property correctly", ^{
                [[controller should] receive:@selector(setAddedItem:) withArguments:@"Added!"];
                [controller didAddItem:@"Added!"];
            });
        });
        
        context(@"#didReplaceItemWithtItem:atIndex:", ^{
            it(@"should sets the replacedItem property correct", ^{
                [[controller should] receive:@selector(setReplacedItem:) withArguments:@"Cucumber"];
                [controller didReplaceItemWithtItem:@"Cucumber" atIndex:0];
            });
            
            it(@"sets the replacedItemIndex property correct", ^{
                [[controller should] receive:@selector(setReplacedItemIndex:) withArguments:theValue(0)];
                [controller didReplaceItemWithtItem:@"Cucumber" atIndex:0];
            });
        });
        
        context(@"#didRemoveItem:atIndex:", ^{
            it(@"should sets the removedItem property correct", ^{
                [[controller should] receive:@selector(setRemovedItem:) withArguments:@"Carrot"];
                [controller didRemoveItem:@"Carrot" atIndex:0];
            });
            
            it(@"should sets the removedItemIndex property correct", ^{
                [[controller should] receive:@selector(setRemovedItemIndex:) withArguments:theValue(0)];
                [controller didRemoveItem:@"Carrot" atIndex:0];
            });
        });
    });
    
    context(@"#setupTextView", ^{
        it(@"sets up the textView", ^{
            NSString *expectedText = @"Adding item to fancy mutable array...\nOld Shoe added!\nReplacing item in fancy mutable array...\nNew Shoe replaced at index: 0\nRemoving item in fancy mutable array...\nNew Shoe removed at index: 0\n";

            [[controller.fancyMutableArray should] receive:@selector(addItem:) withArguments:@"Old Shoe"];
            [[controller.fancyMutableArray should] receive:@selector(replaceItem:atIndex:) withArguments:@"New Shoe", theValue(0)];
            [[controller.fancyMutableArray should] receive:@selector(removeItemAtIndex:) withArguments:theValue(0)];
            
            [[controller should] receive:@selector(addedItem) andReturn:@"Old Shoe"];
            [[controller should] receive:@selector(replacedItem) andReturn:@"New Shoe"];
            [[controller should] receive:@selector(replacedItemIndex) andReturn:theValue(0)];
            [[controller should] receive:@selector(removedItem) andReturn:@"New Shoe"];
            [[controller should] receive:@selector(removedItemIndex) andReturn:theValue(0)];
            
            [controller setupTextView];

            [[controller.textView.text should] equal:expectedText];

        });
    });
});

SPEC_END