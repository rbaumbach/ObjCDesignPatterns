

@interface FancyLookupTable : NSObject

+ (id)sharedInstance;

- (NSString *)getFancyItem:(NSString *)fancyItem;
- (void)addFancyItem:(NSString *)fancyItem
             withKey:(NSString *)key;

@end
