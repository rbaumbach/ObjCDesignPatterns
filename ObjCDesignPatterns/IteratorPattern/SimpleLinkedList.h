#import "Iterator.h"
#import "SimpleNode.h"


@interface SimpleLinkedList : NSObject

@property (strong, nonatomic, readonly) SimpleNode *headNode;

- (void)addItem:(id)item;
- (NSInteger)count;
- (id)getItemAtIndex:(NSInteger)index;
- (id<Iterator>)createIterator;

@end
