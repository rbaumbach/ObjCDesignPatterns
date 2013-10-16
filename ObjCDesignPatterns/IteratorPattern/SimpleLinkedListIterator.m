#import "SimpleLinkedListIterator.h"


@interface SimpleLinkedListIterator ()

@property (strong, nonatomic) SimpleLinkedList *simpleLinkedList;
@property (nonatomic) NSInteger position;

@end


@implementation SimpleLinkedListIterator


#pragma mark - Init Methods

- (id)initWithSimpleLinkedList:(SimpleLinkedList *)simpleLinkedList
{
    self = [super init];
    if (self) {
        self.simpleLinkedList = simpleLinkedList;
        self.position = 0;
    }
    return self;
}

#pragma mark - <Iterator>

- (id)next
{
    id item = [self.simpleLinkedList getItemAtIndex:self.position];
    self.position++;
    
    return item;
}

- (BOOL)hasNext
{
    if (self.position >= [self.simpleLinkedList count]) {
        return NO;
    } else {
        return YES;
    }
}

@end
