#import "FancyLookupTable.h"


@implementation FancyLookupTable

- (id)init
{
    [NSException raise:@"FancyLookupTable"
                format:@"Cannot instantiate singleton using init method, sharedInstance must be used"];
    return nil;
}

- (id)initSingleton
{
    return [super init];
}

+ (id)sharedInstance
{
    static FancyLookupTable *instance;
    
    if (!instance) {
        instance = [[FancyLookupTable alloc] initSingleton];
    }
    
    return instance;
}

@end
