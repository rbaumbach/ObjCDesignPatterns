#import "SimpleLinkedListIterator.h"
#import "SimpleNode.h"


@interface SimpleLinkedListIterator ()

@property (strong, nonatomic) SimpleLinkedList *simpleLinkedList;
@property (strong, nonatomic) SimpleNode *currentNode;

@end


@implementation SimpleLinkedListIterator


#pragma mark - Init Methods

- (id)initWithSimpleLinkedList:(SimpleLinkedList *)simpleLinkedList
{
    self = [super init];
    if (self) {
        self.simpleLinkedList = simpleLinkedList;
        self.currentNode = simpleLinkedList.headNode;
    }
    return self;
}

#pragma mark - <Iterator>

- (id)next
{
    id item = self.currentNode.item;
    self.currentNode = self.currentNode.nextNode;
    
    return item;
}

- (BOOL)hasNext
{
    if (!self.currentNode) {
        return NO;
    } else {
        return YES;
    }
}

@end
