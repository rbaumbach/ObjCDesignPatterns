#import "Kiwi.h"
#import "SimpleNode.h"


SPEC_BEGIN(SimpleNodeSpec)

describe(@"SimpleNode", ^{
    __block SimpleNode *simpleNode;
    __block SimpleNode *simpleNextNode;
    
    beforeEach(^{
        simpleNode = [[SimpleNode alloc] initWithItem:@"uno"];
        simpleNextNode = [[SimpleNode alloc] init];
        
        simpleNode.nextNode = simpleNextNode;
    });
    
    it(@"has a nextNode property", ^{
        [[simpleNode.nextNode should] equal:simpleNextNode];
    });
    
    it(@"has an item property", ^{
        [[simpleNode.item should] equal:@"uno"];
    });
});

SPEC_END