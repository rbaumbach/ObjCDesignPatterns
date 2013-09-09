#import "Kiwi.h"
#import "Beverage.h"


SPEC_BEGIN(BeverageSpec)

describe(@"Beverage", ^{
    __block Beverage *beverage;
    
    beforeEach(^{
        beverage = [[Beverage alloc] init];
        beverage.name = @"BitterBeer";
    });
    
    it(@"has a name", ^{
        [[beverage.name should] equal:@"BitterBeer"];
    });
    
    it(@"has a prepare method", ^{
        [[beverage should] respondToSelector:@selector(prepare)];
    });
    
    it(@"has a pour method", ^{
        [[beverage should] respondToSelector:@selector(pour)];
    });
});

SPEC_END