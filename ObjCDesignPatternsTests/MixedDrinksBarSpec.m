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
                BOOL isRumAndCoke = [rumAndCoke isKindOfClass:[RumAndCoke class]];
                [[theValue(isRumAndCoke) should] beYes];
            });
        });
        
        context(@"WhiskeySour", ^{
            it(@"creates a whiskeySour", ^{
                Beverage *whiskeySour = [bar orderBeverage:@"WhiskeySour"];
                BOOL isWhiskeySour = [whiskeySour isKindOfClass:[WhiskeySour class]];
                [[theValue(isWhiskeySour) should] beYes];
            });
        });
        
        context(@"JagerBomb", ^{
            it(@"creates an jagerBomb", ^{
                Beverage *jagerBomb = [bar orderBeverage:@"JagerBomb"];
                BOOL isJagerBomb = [jagerBomb isKindOfClass:[JagerBomb class]];
                [[theValue(isJagerBomb) should] beYes];
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