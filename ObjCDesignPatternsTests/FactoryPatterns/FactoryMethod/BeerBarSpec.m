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
    
    it(@"is a subclass of Bar", ^{
        [[bar should] beKindOfClass:[Bar class]];
    });
    
    it(@"is called 'Beer Bar'", ^{
        [[bar.name should] equal:@"Beer Bar"];
    });
    
    context(@"#createBeverage:", ^{
        context(@"Lager", ^{
            it(@"creates a lager", ^{
                Beverage *lager = [bar orderBeverage:@"Lager"];
                [[lager should] beKindOfClass:[Lager class]];
            });
        });
        
        context(@"Stout", ^{
            it(@"creates a stout", ^{
                Beverage *stout = [bar orderBeverage:@"Stout"];
                [[stout should] beKindOfClass:[Stout class]];
            });
        });
        
        context(@"Ale", ^{
            it(@"creates an ale", ^{
                Beverage *ale = [bar orderBeverage:@"Ale"];
                [[ale should] beKindOfClass:[Ale class]];
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