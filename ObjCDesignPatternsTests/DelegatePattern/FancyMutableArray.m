#import "Kiwi.h"
#import "FancyMutableArray.h"


@interface FancyMutableArray ()

@property (strong, nonatomic) NSMutableArray *mutableArray;

@end


SPEC_BEGIN(FancyMutableArraySpec)

describe(@"FancyMutableArray", ^{
    __block FancyMutableArray *array;
    __block id<FancyMutableArrayDelegate> fakeDelegate;
    __block NSMutableArray *fakeMutableArray;
    
    beforeEach(^{
        array = [[FancyMutableArray alloc] init];
        
        fakeDelegate = [KWMock nullMockForProtocol:@protocol(FancyMutableArrayDelegate)];
        array.delegate = fakeDelegate;
        
        fakeMutableArray = [NSMutableArray nullMock];
        array.mutableArray = fakeMutableArray;
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
        it(@"returns object at index", ^{
            [[array.mutableArray should] receive:@selector(objectAtIndex:)
                                       andReturn:@"fakeItem"
                                   withArguments:theValue(0)];
            [[[array getItemAtIndex:0] should] equal:@"fakeItem"];
        });
    });
    
    context(@"#addItem:", ^{
        it(@"adds item to internal mutable array", ^{
            [[array.mutableArray should] receive:@selector(addObject:) withArguments:@"billyGoat"];
            [array addItem:@"billyGoat"];
            
        });
        
        it(@"calls #didAddItem: on delegate", ^{
            [[(NSObject *)array.delegate should] receive:@selector(didAddItem:)
                                           withArguments:@"billyGoat"];
            [array addItem:@"billyGoat"];
        });
    });
    
    context(@"#replaceItem:atIndex:", ^{
        it(@"replaces item to internal mutable array at given index", ^{
            [[array.mutableArray should] receive:@selector(replaceObjectAtIndex:withObject:)
                                   withArguments:theValue(0), @"replaced!"];
            [array replaceItem:@"replaced!" atIndex:0];
        });
        
        it(@"calls #didReplaceItemWithtItem:atIndex: on delegate", ^{
            [[(NSObject *)array.delegate should] receive:@selector(didReplaceItemWithtItem:atIndex:)
                                           withArguments:@"fredsanford", theValue(0)];
            [array replaceItem:@"fredsanford" atIndex:0];
        });
    });
    
    context(@"#removeItemAtIndex:", ^{
        it(@"removes the item from the array", ^{
            [[array.mutableArray should] receive:@selector(removeObjectAtIndex:)
                                   withArguments:theValue(0)];
            [array removeItemAtIndex:0];
        });
        
        it(@"calls #didRemoveItem:atIndex:", ^{
            [[array.mutableArray should] receive:@selector(objectAtIndex:)
                                       andReturn:@"iwillberemoved"
                                   withArguments:theValue(0)];
            [[(NSObject *)array.delegate should] receive:@selector(didRemoveItem:atIndex:)
                                           withArguments:@"iwillberemoved", theValue(0)];
            [array removeItemAtIndex:0];
        });
    });
});

SPEC_END