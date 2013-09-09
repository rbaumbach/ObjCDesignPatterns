#import "Kiwi.h"
#import "MixedDrinksBar.h"
#import "RumAndCoke.h"
#import "WhiskeySour.h"
#import "JagerBomb.h"


SPEC_BEGIN(MixedDrinksBarSpec)

describe(@"MixedDrinksBar", ^{
    __block MixedDrinksBar *bar;
    
    beforeEach(^{
        bar = [[MixedDrinksBar alloc] init];
    });
    
    context(@"#createBeverage:", ^{
        context(@"RumAndCoke", ^{
            it(@"creates a rumAndCoke", ^{
                Beverage *rumAndCoke = [bar orderBeverage:@"RumAndCoke"];
                [[rumAndCoke should] beKindOfClass:[RumAndCoke class]];
            });
        });
        
        context(@"WhiskeySour", ^{
            it(@"creates a whiskeySour", ^{
                Beverage *whiskeySour = [bar orderBeverage:@"WhiskeySour"];
                [[whiskeySour should] beKindOfClass:[WhiskeySour class]];
            });
        });
        
        context(@"JagerBomb", ^{
            it(@"creates an jagerBomb", ^{
                Beverage *jagerBomb = [bar orderBeverage:@"JagerBomb"];
                [[jagerBomb should] beKindOfClass:[JagerBomb class]];
            });
        });
        
        context(@"Unsupported beverageType", ^{
            it(@"is nil", ^{
                Beverage *virginMargarita = [bar orderBeverage:@"VirginMargarita"];
                [virginMargarita shouldBeNil];
            });
        });
    });
});

SPEC_END