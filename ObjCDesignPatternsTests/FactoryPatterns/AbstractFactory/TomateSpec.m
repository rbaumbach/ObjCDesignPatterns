#import "Kiwi.h"
#import "Tomate.h"


SPEC_BEGIN(TomateSpec)

describe(@"Tomate", ^{
    __block Tomate *tomate;
    
    beforeEach(^{
        tomate = [[Tomate alloc] init];
    });
    
    it(@"is a subclass of vedura", ^{
        [[tomate should] beKindOfClass:[Tomate class]];
    });
    
    it(@"is not nil", ^{
        [tomate shouldNotBeNil];
    });
    
    it(@"is called 'Tomate'", ^{
        tomate.name = @"Tomate";
    });
});

SPEC_END