#import "Kiwi.h"
#import "SimpleLinkedListIterator.h"
#import "SimpleLinkedList.h"


@interface SimpleLinkedListIterator ()

@property (strong, nonatomic) SimpleLinkedList *simpleLinkedList;
@property (nonatomic) NSInteger position;

@end


SPEC_BEGIN(SimpleLinkedListIteratorSpec)

describe(@"SimpleLinkedListIterator", ^{
    __block SimpleLinkedListIterator *iterator;
    __block SimpleLinkedList *fakeSimpleLinkedList;
    
    beforeEach(^{
        fakeSimpleLinkedList = [SimpleLinkedList mock];
        iterator = [[SimpleLinkedListIterator alloc] initWithSimpleLinkedList:fakeSimpleLinkedList];
    });
    
    it(@"conforms to <Iterator>", ^{
        [[iterator should] conformToProtocol:@protocol(Iterator)];
    });
    
    it(@"has a SimpleLinkedList", ^{
        [iterator.simpleLinkedList shouldNotBeNil];
    });
    
    it(@"has a position of 0", ^{
        [[theValue(iterator.position) should] equal:theValue(0)];
    });
    
    context(@"<Iterator>", ^{
        context(@"#next", ^{
            __block id item;
            
            beforeEach(^{
                [[iterator.simpleLinkedList should] receive:@selector(getItemAtIndex:) andReturn:@"hotLink0"
                                              withArguments:theValue(iterator.position)];
                
                item = [iterator next];
            });
            
            it(@"returns the correct item", ^{
                [[item should] equal:@"hotLink0"];
            });
            
            it(@"increments the position", ^{
                [[theValue(iterator.position) should] equal:theValue(1)];
            });
        });
        
        context(@"#hasNext", ^{
            beforeEach(^{
                iterator.position = 3;
            });
            
            context(@"position is out of bounds", ^{
                beforeEach(^{
                    [[iterator.simpleLinkedList should] receive:@selector(count) andReturn:theValue(2)];
                });
                
                it(@"returns NO", ^{
                    BOOL isOutOfBounds = [iterator hasNext];
                    [[theValue(isOutOfBounds) should] beNo];
                });
            });
            
            context(@"position is in bounds", ^{
                beforeEach(^{
                    beforeEach(^{
                        [[iterator.simpleLinkedList should] receive:@selector(count) andReturn:theValue(2)];
                    });
                    
                    it(@"returns YES", ^{
                        BOOL isInBounds = [iterator hasNext];
                        [[theValue(isInBounds) should] beYes];
                    });
                });
            });
        });
    });
});

SPEC_END