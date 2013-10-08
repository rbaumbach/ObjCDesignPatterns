#import "FancyMutableArray.h"


@interface FancyMutableArray ()

@property (strong, nonatomic) NSMutableArray *mutableArray;

@end


@implementation FancyMutableArray

#pragma mark - Init Methods

- (id)init
{
    self = [super init];
    if (self) {
        self.mutableArray = [@[] mutableCopy];
    }
    return self;
}

#pragma mark - Public Methods

- (NSString *)getItemAtIndex:(int)index
{
    return [self.mutableArray objectAtIndex:index];
}

- (void)addItem:(NSString *)item
{
    [self.mutableArray addObject:item];
    [self.delegate didAddItem:item];
}

- (void)replaceItem:(NSString *)replacementItem
            atIndex:(int)index
{
    [self.mutableArray replaceObjectAtIndex:index
                                 withObject:replacementItem];
    [self.delegate didReplaceItemWithtItem:replacementItem
                                   atIndex:index];
}

- (void)removeItemAtIndex:(int)index
{
    NSString *removedItem = [self.mutableArray objectAtIndex:index];
    [self.mutableArray removeObjectAtIndex:index];
    [self.delegate didRemoveItem:removedItem atIndex:index];
}

@end
