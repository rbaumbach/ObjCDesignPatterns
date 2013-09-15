#import "Kiwi.h"
#import "Carnitas.h"


SPEC_BEGIN(CarnitasSpec)

describe(@"Carnitas", ^{
    __block Carnitas *carnitas;
    
    beforeEach(^{
        carnitas = [[Carnitas alloc] init];
    });
    
    it(@"is a subclass of pork", ^{
        [[carnitas should] beKindOfClass:[Pork class]];
    });
    
    it(@"is not nil", ^{
        [carnitas shouldNotBeNil];
    });
});

SPEC_END