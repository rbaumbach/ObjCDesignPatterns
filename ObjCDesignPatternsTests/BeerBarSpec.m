#import "Kiwi.h"
#import "BeerBar.h"
#import "Beverage.h"
#import "Lager.h"
#import "Stout.h"
#import "Ale.h"


SPEC_BEGIN(BeerBarSpec)

describe(@"BeerBar", ^{
    __block BeerBar *bar;
    
    beforeEach(^{
        bar = [[BeerBar alloc] init];
    });
    
    context(@"#createBeverage:", ^{
        context(@"Lager", ^{
            it(@"creates a lager", ^{
                Beverage *lager = [bar orderBeverage:@"Lager"];
                BOOL isLager = [lager isKindOfClass:[Lager class]];
                [[theValue(isLager) should] beYes];
            });
        });
        
        context(@"Stout", ^{
            it(@"creates a stout", ^{
                Beverage *stout = [bar orderBeverage:@"Stout"];
                BOOL isStout = [stout isKindOfClass:[Stout class]];
                [[theValue(isStout) should] beYes];
            });
        });
        
        context(@"Ale", ^{
            it(@"creates an ale", ^{
                Beverage *ale = [bar orderBeverage:@"Ale"];
                BOOL isAle = [ale isKindOfClass:[Ale class]];
                [[theValue(isAle) should] beYes];
            });
        });
        
        context(@"Unsupported beverageType", ^{
            it(@"is nil", ^{
                Beverage *h2o = [bar orderBeverage:@"H2O"];
                [h2o shouldBeNil];
            });
        });
    });
});

SPEC_END