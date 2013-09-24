#import "Kiwi.h"
#import "FancyLookupTable.h"


@interface FancyLookupTable ()

- (id)initSingleton;

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
    
    context(@"#initSingleton", ^{
        it(@"initalizes singleton", ^{
            id singleton = [[FancyLookupTable alloc] initSingleton];
            [[singleton should] beKindOfClass:[FancyLookupTable class]];
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
            });;
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
});

SPEC_END

