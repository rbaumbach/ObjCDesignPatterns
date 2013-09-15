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
    
    it(@"is a subclass of Bar", ^{
        [[bar should] beKindOfClass:[Bar class]];
    });
    
    context(@"#createBeverage:", ^{
        context(@"Chardonnay", ^{
            it(@"creates a chardonnay", ^{
                Beverage *chardonnay = [bar orderBeverage:@"Chardonnay"];
                [[chardonnay should] beKindOfClass:[Chardonnay class]];
            });
        });
        
        context(@"Merlot", ^{
            it(@"creates a merlot", ^{
                Beverage *merlot = [bar orderBeverage:@"Merlot"];
                [[merlot should] beKindOfClass:[Merlot class]];
            });
        });
        
        context(@"CabernetSauvignon", ^{
            it(@"creates an cabernetSauvignon", ^{
                Beverage *cabernetSauvignon = [bar orderBeverage:@"CabernetSauvignon"];
                [[cabernetSauvignon should] beKindOfClass:[CabernetSauvignon class]];
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