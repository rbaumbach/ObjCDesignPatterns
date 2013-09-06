#import "Kiwi.h"
#import "WineBar.h"
#import "Beverage.h"
#import "Chardonnay.h"
#import "Merlot.h"
#import "CabernetSauvignon.h"


SPEC_BEGIN(WineBarSpec)

describe(@"WineBar", ^{
    __block WineBar *bar;
    
    beforeEach(^{
        bar = [[WineBar alloc] init];
    });
    
    context(@"#createBeverage:", ^{
        context(@"Chardonnay", ^{
            it(@"creates a chardonnay", ^{
                Beverage *chardonnay = [bar orderBeverage:@"Chardonnay"];
                BOOL isChardonnay = [chardonnay isKindOfClass:[Chardonnay class]];
                [[theValue(isChardonnay) should] beYes];
            });
        });
        
        context(@"Merlot", ^{
            it(@"creates a merlot", ^{
                Beverage *merlot = [bar orderBeverage:@"Merlot"];
                BOOL isMerlot = [merlot isKindOfClass:[Merlot class]];
                [[theValue(isMerlot) should] beYes];
            });
        });
        
        context(@"CabernetSauvignon", ^{
            it(@"creates an cabernetSauvignon", ^{
                Beverage *cabernetSauvignon = [bar orderBeverage:@"CabernetSauvignon"];
                BOOL isCabernetSauvignon = [cabernetSauvignon isKindOfClass:[CabernetSauvignon class]];
                [[theValue(isCabernetSauvignon) should] beYes];
            });
        });
        
        context(@"Unsupported beverageType", ^{
            it(@"is nil", ^{
                Beverage *nightrain = [bar orderBeverage:@"Nightrain"];
                [nightrain shouldBeNil];
            });
        });
    });
});

SPEC_END