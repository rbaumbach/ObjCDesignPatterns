#import "Iterator.h"
#import "SimpleLinkedList.h"

@interface SimpleLinkedListIterator : NSObject <Iterator>

- (id)initWithSimpleLinkedList:(SimpleLinkedList *)simpleLinkedList;

@end
