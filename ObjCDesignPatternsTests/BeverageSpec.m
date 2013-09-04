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
        BOOL hasPrepareMethod = [beverage respondsToSelector:@selector(prepare)];
        [[theValue(hasPrepareMethod) should] beYes];
    });
    
    it(@"has a pour method", ^{
        BOOL hasPourMethod = [beverage respondsToSelector:@selector(pour)];
        [[theValue(hasPourMethod) should] beYes];
    });
});

SPEC_END