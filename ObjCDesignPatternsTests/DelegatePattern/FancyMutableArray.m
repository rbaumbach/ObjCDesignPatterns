#import "Kiwi.h"
#import "FancyMutableArray.h"


@interface FancyMutableArray ()

@property (strong, nonatomic) NSMutableArray *mutableArray;

@end


SPEC_BEGIN(FancyMutableArraySpec)

describe(@"FancyMutableArray", ^{
    __block FancyMutableArray *array;
    __block id<FancyMutableArrayDelegate> fakeDelegate;
    
    beforeEach(^{
        array = [[FancyMutableArray alloc] init];
        
        fakeDelegate = [KWMock nullMockForProtocol:@protocol(FancyMutableArrayDelegate)];
        array.delegate = fakeDelegate;
    });
    
    it(@"is not nil", ^{
        [array shouldNotBeNil];
    });
    
    it(@"has a delegate", ^{
        [[(NSObject *)array.delegate should] equal:fakeDelegate];
    });
    
    it(@"has a NSMutableArray", ^{
        [array.mutableArray shouldNotBeNil];
    });
    
    context(@"#getItemAtIndex:", ^{
        beforeEach(^{
            array.mutableArray = [@[@"stuff"] mutableCopy];
        });
        
        it(@"returns object at index", ^{
            [[[array getItemAtIndex:0] should] equal:@"stuff"];
        });
    });
    
    context(@"#addItem:", ^{
        it(@"adds item to internal mutable array", ^{
            [array addItem:@"lameItem"];
            [[array.mutableArray should] contain:@"lameItem"];
        });
        
        it(@"calls #didAddItem: on delegate", ^{
            [[(NSObject *)array.delegate should] receive:@selector(didAddItem:)
                                           withArguments:@"fancyItem"];
            [array addItem:@"fancyItem"];
        });
    });
    
    context(@"#replaceItem:atIndex:", ^{
        beforeEach(^{
            array.mutableArray = [@[@"iwillbereplaced"] mutableCopy];
        });
        
        it(@"replaces item to internal mutable array at given index", ^{
            [array replaceItem:@"replaced!" atIndex:0];
            [[array.mutableArray[0] should] equal:@"replaced!"];
        });
        
        it(@"calls #didReplaceItemWithtItem:atIndex: on delegate", ^{
            [[(NSObject *)array.delegate should] receive:@selector(didReplaceItemWithtItem:atIndex:)
                                           withArguments:@"fredsanford", theValue(0)];
            [array replaceItem:@"fredsanford" atIndex:0];
        });
    });
    
    context(@"#removeItemAtIndex:", ^{
        beforeEach(^{
            array.mutableArray = [@[@"iwillberemoved"] mutableCopy];
        });
        
        it(@"removes the item from the array", ^{
            [array removeItemAtIndex:0];
            [[array.mutableArray shouldNot] contain:@"iwillberemoved"];
        });
        
        it(@"calls #didRemoveItem:atIndex:", ^{
            [[(NSObject *)array.delegate should] receive:@selector(didRemoveItem:atIndex:)
                                           withArguments:@"iwillberemoved", theValue(0)];
            [array removeItemAtIndex:0];
        });
    });
});

SPEC_END