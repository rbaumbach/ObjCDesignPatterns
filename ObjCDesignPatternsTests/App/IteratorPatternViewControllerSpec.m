#import "Kiwi.h"
#import "Swizzlean.h"
#import "IteratorPatternViewController.h"
#import "SimpleLinkedList.h"


@interface IteratorPatternViewController ()

@property (strong, nonatomic) SimpleLinkedList *simpleLinkedList;

- (void)setupTextView;
- (NSString *)createLinkedListText:(id<Iterator>)iterator;

@end


SPEC_BEGIN(IteratorPatternViewControllerSpec)

describe(@"IteratorPatternViewController", ^{
    __block IteratorPatternViewController *controller;
    
    beforeEach(^{
        controller = [[IteratorPatternViewController alloc] init];
        [controller view];
    });
    
    it(@"should not be nil", ^{
        [controller shouldNotBeNil];
    });
    
    it(@"is a subclass of UIViewController", ^{
        [[controller should] beKindOfClass:[UIViewController class]];
    });
    
    it(@"has correct title", ^{
        [[controller.title should] equal:@"Iterator Pattern"];
    });
    
    it(@"has a simpleLinkedList", ^{
        [controller.simpleLinkedList shouldNotBeNil];
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
        __block NSString *expectedText;
        __block id<Iterator> fakeIterator;
        
        beforeEach(^{
            expectedText = @"Adding 3 elements to the simple linked list...\nCreating simple linked list iterator...\nIterating through linked list...\nboring -> nil";
            fakeIterator = [KWMock mockForProtocol:@protocol(Iterator)];
            SimpleLinkedList *fakeSimpleLinkedList = [SimpleLinkedList mock];
            controller.simpleLinkedList = fakeSimpleLinkedList;
            
            [[controller.simpleLinkedList should] receive:@selector(addItem:) withArguments:@"0"];
            [[controller.simpleLinkedList should] receive:@selector(addItem:) withArguments:@"1"];
            [[controller.simpleLinkedList should] receive:@selector(addItem:) withArguments:@"2"];
            [[controller.simpleLinkedList should] receive:@selector(createIterator) andReturn:fakeIterator];
            
            [[controller should] receive:@selector(createLinkedListText:)
                               andReturn:@"boring -> nil"
                           withArguments:fakeIterator];
            
            [controller setupTextView];
        });

        it(@"sets up the textView", ^{
            [[controller.textView.text should] equal:expectedText];
        });
    });
    
    context(@"#createLinkedListText:", ^{
        __block NSString *linkedListText;
        __block SimpleLinkedList *simpleLinkedList;
        __block id<Iterator> simpleLinkedListIterator;
        
        beforeEach(^{
            simpleLinkedList = [[SimpleLinkedList alloc] init];
        });
        
        context(@"empty simple linked list", ^{
            beforeEach(^{
                simpleLinkedListIterator = [simpleLinkedList createIterator];
                linkedListText = [controller createLinkedListText:simpleLinkedListIterator];
            });
            
            it(@"displays text 'nil' only", ^{
                [[linkedListText should] equal:@"nil"];
            });
        });
        
        context(@"non-empty simple linked list", ^{
            beforeEach(^{
                [simpleLinkedList addItem:@"0"];
                [simpleLinkedList addItem:@"1"];
                [simpleLinkedList addItem:@"2"];
                
                simpleLinkedListIterator = [simpleLinkedList createIterator];
                linkedListText = [controller createLinkedListText:simpleLinkedListIterator];
            });
            
            it(@"creates text form of simple linked list", ^{
                [[linkedListText should] equal:@"0 -> 1 -> 2 -> nil"];
            });
        });
    });
});

SPEC_END