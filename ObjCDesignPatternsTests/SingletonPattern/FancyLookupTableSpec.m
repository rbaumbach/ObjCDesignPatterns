#import "Kiwi.h"
#import "FancyLookupTable.h"


@interface FancyLookupTable ()

@property (strong, nonatomic) NSMutableDictionary *lookupTable;

- (id)initSingleton;
- (void)setupLookupTable;

@end


SPEC_BEGIN(FancyLookupTableSpec)

describe(@"FancyLookupTable", ^{
    context(@"#init", ^{
        __block id singleton;
        
        it(@"throws an exception since this is a singleton", ^{
            [[theBlock(^{ singleton = [[FancyLookupTable alloc] init]; }) should] raiseWithName:@"FancyLookupTable"
                                                                                         reason:@"Cannot instantiate singleton using init method, sharedInstance must be used"];
        });
    });
    
    context(@"#copyWithZone aka #copy", ^{
        __block id singleton;
        
        it(@"throws an exception since this is a singleton", ^{
            [[theBlock(^{ singleton = [[FancyLookupTable alloc] copy]; }) should] raiseWithName:@"FancyLookupTable"
                                                                                         reason:@"Cannot copy singleton using copy method, sharedInstance must be used"];
        });
    });
    
    context(@"#sharedInstance", ^{
        __block FancyLookupTable *fancyLookupTable;
        
        beforeEach(^{
            fancyLookupTable = [FancyLookupTable sharedInstance];
        });
        
        context(@"instance does not exist", ^{
            it(@"creates an instance", ^{
                [[fancyLookupTable should] beKindOfClass:[FancyLookupTable class]];
            });
            
            it(@"adds default fancy items to FancyLookupTable", ^{
                NSDictionary *lookupDict = @{ @"fancyDish"   : @"platinum dish",
                                              @"fancyKnife"  : @"platinum knife",
                                              @"fancyFork"   : @"platinum fork",
                                              @"fancySpoon"  : @"platinum spoon",
                                              @"fancyGoblet" : @"platinum goblet" };
                
                [[fancyLookupTable.lookupTable should] equal:lookupDict];
            });
        });
        
        context(@"instance already exists", ^{
            __block FancyLookupTable *previousInstance;
            
            beforeEach(^{
                previousInstance = fancyLookupTable;
                fancyLookupTable = [FancyLookupTable sharedInstance];
            });
            
            it(@"returns previously created instance", ^{
                [[previousInstance should] equal:fancyLookupTable];
            });
        });
    });
    
    context(@"#getFancyItem", ^{
        __block FancyLookupTable *singleton;
        __block NSString *fancyItem;
        
        beforeEach(^{
            singleton = [FancyLookupTable sharedInstance];
        });
        
        it(@"gets a fancy item from the fancy lookup table", ^{
            [[singleton.lookupTable should] receive:@selector(objectForKey:) withArguments:@"fancyGoblet"];
            fancyItem = [singleton getFancyItem:@"fancyGoblet"];
        });
    });
    
    context(@"#addFancyItem", ^{
        __block FancyLookupTable *singleton;
        
        beforeEach(^{
            singleton = [FancyLookupTable sharedInstance];
        });
        
        it(@"gets a fancy item from the fancy lookup table", ^{
            [[singleton.lookupTable should] receive:@selector(setObject:forKey:) withArguments:@"golden dog", @"fancyDog"];
            [singleton addFancyItem:@"golden dog" withKey:@"fancyDog"];
        });
    });
    
    context(@"#initSingleton", ^{
        it(@"initalizes singleton", ^{
            id singleton = [[FancyLookupTable alloc] initSingleton];
            [[singleton should] beKindOfClass:[FancyLookupTable class]];
        });
    });
});

SPEC_END

