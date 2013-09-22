#import "Kiwi.h"
#import "Queso.h"


SPEC_BEGIN(QuesoSpec)

describe(@"Queso", ^{
    __block Queso *queso;
    
    beforeEach(^{
        queso = [[Queso alloc] init];
        queso.name = @"Velveeta";
    });
    
    it(@"is not nil", ^{
        [queso shouldNotBeNil];
    });
    
    it(@"has a name property", ^{
        [[queso.name should] equal:@"Velveeta"];
    });
});

SPEC_END