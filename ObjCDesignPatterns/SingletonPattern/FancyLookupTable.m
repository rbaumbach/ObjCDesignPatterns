#import "FancyLookupTable.h"


@interface FancyLookupTable ()

@property (strong, nonatomic) NSMutableDictionary *lookupTable;

@end


@implementation FancyLookupTable

#pragma mark - Public Methods

- (id)init
{
    [NSException raise:@"FancyLookupTable"
                format:@"Cannot instantiate singleton using init method, sharedInstance must be used"];
    return nil;
}

+ (id)sharedInstance
{
    static FancyLookupTable *instance;
    
    if (!instance) {
        instance = [[FancyLookupTable alloc] initSingleton];
        [instance setupLookupTable];
    }
    
    return instance;
}

- (NSString *)getFancyItem:(NSString *)fancyItem
{
    return self.lookupTable[fancyItem];
}

- (void)addFancyItem:(NSString *)fancyItem
             withKey:(NSString *)key
{
    self.lookupTable[key] = fancyItem;
}

#pragma mark - Private Methods

- (id)initSingleton
{
    return [super init];
}

- (void)setupLookupTable
{
    NSDictionary *defaultItems = @{ @"fancyDish"   : @"platinum dish",
                                    @"fancyKnife"  : @"platinum knife",
                                    @"fancyFork"   : @"platinum fork",
                                    @"fancySpoon"  : @"platinum spoon",
                                    @"fancyGoblet" : @"platinum goblet" };
    
    self.lookupTable = [defaultItems mutableCopy];
}

@end