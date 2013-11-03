#import "Iterator.h"
#import "SimpleNode.h"


@interface SimpleLinkedList : NSObject

@property (strong, nonatomic, readonly) SimpleNode *headNode;

- (void)addItem:(id)item;
- (NSInteger)count;

- (id<Iterator>)createIterator;

- (void)enumerateObjectsUsingBlock:(void (^)(id obj, BOOL *stop))block;

@end
