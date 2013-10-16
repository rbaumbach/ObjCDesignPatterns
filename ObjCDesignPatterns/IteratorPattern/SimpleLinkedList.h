#import "Iterator.h"


@interface SimpleLinkedList : NSObject

- (void)addItem:(id)item;
- (NSInteger)count;
- (id)getItemAtIndex:(NSInteger)index;
- (id<Iterator>)createIterator;

@end
