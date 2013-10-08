

@protocol FancyMutableArrayDelegate <NSObject>

- (void)didAddItem:(id)item;
- (void)didReplaceItemWithtItem:(id)item
                        atIndex:(int)index;
- (void)didRemoveItem:(id)item
              atIndex:(int)index;

@end
