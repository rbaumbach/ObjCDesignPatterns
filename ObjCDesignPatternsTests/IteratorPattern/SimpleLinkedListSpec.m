#import "Kiwi.h"
#import "SimpleLinkedList.h"
#import "SimpleNode.h"
#import "Iterator.h"
#import "SimpleLinkedListIterator.h"
#import "Swizzlean.h"

@interface SimpleLinkedList ()

@property (strong, nonatomic, readwrite) SimpleNode *headNode;
@property (nonatomic) NSInteger numberOfNodes;

- (void)addItem:(id)item
           node:(SimpleNode *)node;

@end


SPEC_BEGIN(SimpleLinkedListSpec)

describe(@"SimpleLinkedList", ^{
    __block SimpleLinkedList *simpleLinkedList;
    
    beforeEach(^{
        simpleLinkedList = [[SimpleLinkedList alloc] init];
    });

    it(@"has a headNode", ^{
        SimpleNode *node = [[SimpleNode alloc] init];
        simpleLinkedList.headNode = node;
        [[simpleLinkedList.headNode should] equal:node];
    });
    
    it(@"has a node count of 0", ^{
        [[theValue(simpleLinkedList.numberOfNodes) should] equal:theValue(0)];
    });
    
    context(@"#count", ^{
        it(@"returns the linked list count", ^{
            [[simpleLinkedList should] receive:@selector(numberOfNodes)
                                     andReturn:theValue(5)];
            
            NSInteger nodeCount = [simpleLinkedList count];
            [[theValue(nodeCount) should] equal:theValue(5)];
        });
    });
    
    context(@"#addItem:", ^{
        context(@"empty list", ^{
            beforeEach(^{
                [simpleLinkedList addItem:@"crazy bull"];
            });
            
            it(@"creates head node", ^{
                [[simpleLinkedList.headNode.item should] equal:@"crazy bull"];
            });
            
            it(@"increments the count", ^{
                NSInteger count = [simpleLinkedList count];
                [[theValue(count) should] equal:theValue(1)];
            });
        });
        
        context(@"non-empty list", ^{
            beforeEach(^{
                simpleLinkedList.headNode = [[SimpleNode alloc] init];
            });
            
            it(@"adds node to the end of the list", ^{
                [[simpleLinkedList should] receive:@selector(addItem:node:)
                                     withArguments:@"Julian", simpleLinkedList.headNode];
                
                [simpleLinkedList addItem:@"Julian"];
            });
        });
    });
    
    context(@"#addLastNode:withItem:", ^{
        __block SimpleNode *secondNode;
        
        beforeEach(^{
            SimpleNode *firstNode = [[SimpleNode alloc] initWithItem:@"first"];
            secondNode = [[SimpleNode alloc] initWithItem:@"second"];
            firstNode.nextNode = secondNode;
            
            simpleLinkedList.headNode = firstNode;
        });
        
        it(@"adds node to the end of the list", ^{
            [simpleLinkedList addItem:@"third"
                                 node:simpleLinkedList.headNode];
            
            [[secondNode.nextNode.item should] equal:@"third"];
        });
    });
    
    context(@"#createIterator", ^{
        __block id<Iterator> iterator;
        __block id<Iterator> fakeIterator;
        __block Swizzlean *createIteratorSwizz;
        __block SimpleLinkedList *retSimpleLinkedList;
        
        beforeEach(^{
            fakeIterator = [KWMock mockForProtocol:@protocol(Iterator)];
            
            createIteratorSwizz = [[Swizzlean alloc] initWithClassToSwizzle:[SimpleLinkedListIterator class]];
            [createIteratorSwizz swizzleInstanceMethod:@selector(initWithSimpleLinkedList:)
                         withReplacementImplementation:^(id _self, SimpleLinkedList *linkedList) {
                             retSimpleLinkedList = linkedList;
                             return fakeIterator;
                }];
            
            iterator = [simpleLinkedList createIterator];
        });
        
        it(@"creates iterator", ^{
            [[(NSObject *)iterator should] equal:fakeIterator];
        });
    });
    
    context(@"#enumerateObjectsUsingBlock:", ^{
        __block NSMutableArray *arrayOfNodes;
        
        beforeEach(^{
            SimpleNode *first = [[SimpleNode alloc] initWithItem:@1];
            SimpleNode *second = [[SimpleNode alloc] initWithItem:@2];
            SimpleNode *third = [[SimpleNode alloc] initWithItem:@3];
            
            second.nextNode = third;
            first.nextNode = second;
            
            simpleLinkedList.headNode = first;
            
            arrayOfNodes = [@[] mutableCopy];
        });
        
        context(@"enumerating through all linked list items", ^{
            beforeEach(^{
                [simpleLinkedList enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
                    [arrayOfNodes addObject:obj];
                }];
            });
            
            it(@"executes the block passed in", ^{
                [[theValue(arrayOfNodes.count) should] equal:theValue(3)];
                [[arrayOfNodes[0] should] equal:@1];
                [[arrayOfNodes[1] should] equal:@2];
                [[arrayOfNodes[2] should] equal:@3];
            });
        });
        
        context(@"stoping enumeration", ^{
            beforeEach(^{
                [simpleLinkedList enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
                    [arrayOfNodes addObject:obj];
                    
                    if ([(NSNumber *)obj intValue] == 2) {
                        *stop = YES;
                    }
                }];
            });
            
            it(@"stops the enumeration", ^{
                [[theValue(arrayOfNodes.count) should] equal:theValue(2)];
                [[arrayOfNodes[0] should] equal:@1];
                [[arrayOfNodes[1] should] equal:@2];
            });
        });
    });
});

SPEC_END