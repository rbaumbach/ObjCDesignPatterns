#import "FancyMutableArrayDelegate.h"


@interface FancyMutableArray : NSObject

@property (weak, nonatomic) id<FancyMutableArrayDelegate> delegate;

- (NSString *)getItemAtIndex:(int)index;
- (void)addItem:(NSString *)item;
- (void)replaceItem:(NSString *)replacementItem
            atIndex:(int)index;
- (void)removeItemAtIndex:(int)index;

@end
