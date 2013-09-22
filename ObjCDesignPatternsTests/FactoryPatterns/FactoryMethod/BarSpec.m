#import "Kiwi.h"
#import "Bar.h"
#import "Beverage.h"


@interface Bar ()

- (Beverage *)createBeverage:(NSString *)beverageType;

@end


SPEC_BEGIN(BarSpec)

describe(@"Bar", ^{
    __block Bar *bar;
    
    beforeEach(^{
        bar = [[Bar alloc] init];
        bar.name = @"Bar";
    });
    
    it(@"has a name property", ^{
        [[bar.name should] equal:@"Bar"];
    });
    
    context(@"#orderBeverage:", ^{
        __block Beverage *fakeBeverage;
        __block Beverage *returnBeverage;
        
        beforeEach(^{
            fakeBeverage = [Beverage mock];
            [[bar should] receive:@selector(createBeverage:) andReturn:fakeBeverage withArguments:@"IReturnBeverage"];
            
            [[fakeBeverage should] receive:@selector(prepare)];
            [[fakeBeverage should] receive:@selector(pour)];
            
            returnBeverage = [bar orderBeverage:@"IReturnBeverage"];
        });
        
        it(@"returns a beverage", ^{
            [[returnBeverage should] equal:fakeBeverage];
        });
    });
    
    context(@"#createBeverage:", ^{
        __block Beverage *beverage;
        
        beforeEach(^{
            beverage = [bar createBeverage:@"IReturnBeverage"];
        });
        
        it(@"is a beverage type", ^{
            BOOL isBeverage = [beverage isKindOfClass:[Beverage class]];
            [[theValue(isBeverage) should] beYes];
        });
    });
});

SPEC_END