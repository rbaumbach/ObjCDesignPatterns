#import "SimpleLinkedList.h"
#import "SimpleNode.h"
#import "SimpleLinkedListIterator.h"


@interface SimpleLinkedList ()

@property (strong, nonatomic, readwrite) SimpleNode *headNode;
@property (nonatomic) NSInteger numberOfNodes;

@end


@implementation SimpleLinkedList

- (id)init
{
    self = [super init];
    if (self) {
        self.numberOfNodes = 0;
    }
    return self;
}

#pragma mark - Public Methods

- (void)addItem:(id)item
{
    if (!self.headNode) {
        self.headNode = [[SimpleNode alloc] initWithItem:item];
    } else {
        [self addItem:item
                 node:self.headNode];
    }
    
    self.numberOfNodes++;
}

- (NSInteger)count
{
    return self.numberOfNodes;
}

- (id)getItemAtIndex:(NSInteger)index
{
    if (!self.headNode) {
        return nil;
    }
    
    if (index > self.numberOfNodes - 1) {
        [NSException raise:@"Linked List Out of Bounds"
                    format:@"Attempted to get an item out of bounds"];
        return nil;
    }
    
    SimpleNode *node = self.headNode;
    for (int i = 0; i < index; i++) {
        node = node.nextNode;
    }
    
    return node.item;
}

- (id<Iterator>)createIterator
{
    return [[SimpleLinkedListIterator alloc] initWithSimpleLinkedList:self];
}

#pragma mark - Private Methods

- (void)addItem:(id)item
           node:(SimpleNode *)node
{
    if (!node.nextNode) {
        node.nextNode = [[SimpleNode alloc] initWithItem:item];
    } else {
        [self addItem:item
                 node:node.nextNode];
    }
}

@end
