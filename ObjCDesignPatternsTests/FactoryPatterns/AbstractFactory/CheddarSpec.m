#import "Kiwi.h"
#import "Cheddar.h"


SPEC_BEGIN(CheddarSpec)

describe(@"Cheddar", ^{
    __block Cheddar *cheddar;
    
    beforeEach(^{
        cheddar = [[Cheddar alloc] init];
    });
    
    it(@"is a subclass of queso", ^{
        [[cheddar should] beKindOfClass:[Queso class]];
    });
    
    it(@"is not nil", ^{
        [cheddar shouldNotBeNil];
    });
    
    it(@"is called 'Cheddar'", ^{
        [[cheddar.name should] equal:@"Cheddar"];
    });
});

SPEC_END