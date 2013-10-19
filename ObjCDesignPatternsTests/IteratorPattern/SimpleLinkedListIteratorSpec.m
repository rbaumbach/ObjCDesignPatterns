#import "Kiwi.h"
#import "SimpleLinkedListIterator.h"
#import "SimpleLinkedList.h"
#import "SimpleNode.h"


@interface SimpleLinkedListIterator ()

@property (strong, nonatomic) SimpleLinkedList *simpleLinkedList;
@property (strong, nonatomic) SimpleNode *currentNode;

@end


SPEC_BEGIN(SimpleLinkedListIteratorSpec)

describe(@"SimpleLinkedListIterator", ^{
    __block SimpleLinkedListIterator *iterator;
    __block SimpleLinkedList *fakeSimpleLinkedList;
    __block SimpleNode *fakeHeadNode;
    
    beforeEach(^{
        fakeSimpleLinkedList = [SimpleLinkedList mock];
        fakeHeadNode = [SimpleNode mock];
        [[fakeSimpleLinkedList should] receive:@selector(headNode)
                                     andReturn:fakeHeadNode];
        
        iterator = [[SimpleLinkedListIterator alloc] initWithSimpleLinkedList:fakeSimpleLinkedList];
    });
    
    it(@"conforms to <Iterator>", ^{
        [[iterator should] conformToProtocol:@protocol(Iterator)];
    });
    
    it(@"has a SimpleLinkedList", ^{
        [iterator.simpleLinkedList shouldNotBeNil];
    });
    
    it(@"current node is the simpleLinkedLists headNode", ^{
        [[iterator.currentNode should] equal:fakeHeadNode];
    });
    
    context(@"<Iterator>", ^{
        context(@"#next", ^{
            __block id item;
            __block SimpleNode *fakeNextNode;
            
            beforeEach(^{
                [[iterator.currentNode should] receive:@selector(item)
                                             andReturn:@"Daffy Duck"];
                
                fakeNextNode = [SimpleNode mock];
                [[iterator.currentNode should] receive:@selector(nextNode)
                                             andReturn:fakeNextNode];

                item = [iterator next];
            });
            
            it(@"returns the correct item and increments current node", ^{
                [[item should] equal:@"Daffy Duck"];
            });
            
            it(@"increments the current node", ^{
                [[iterator.currentNode should] equal: fakeNextNode];
            });
        });
    
        context(@"#hasNext", ^{
            __block BOOL hasNext;
            
            context(@"iterator has next node", ^{
                beforeEach(^{
                    hasNext = [iterator hasNext];
                });
                
                it(@"returns YES", ^{
                    [[theValue(hasNext) should] beYes];
                });
            });
            
            context(@"iterator does not have next node", ^{
                beforeEach(^{
                    beforeEach(^{
                        iterator.currentNode = nil;
                        hasNext = [iterator hasNext];
                    });
                    
                    it(@"returns NO", ^{
                        [[theValue(hasNext) should] beNo];
                    });
                });
            });
        });
    });
});

SPEC_END