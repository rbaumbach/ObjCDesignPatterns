#import "Kiwi.h"
#import "Beef.h"


SPEC_BEGIN(BeefSpec)

describe(@"Beef", ^{
    __block Beef *beef;
    
    beforeEach(^{
        beef = [[Beef alloc] init];
        beef.name = @"0xBBADBEEF";
    });
    
    it(@"is not nil", ^{
        [beef shouldNotBeNil];
    });
    
    it(@"has a name property", ^{
        [[beef.name should] equal:@"0xBBADBEEF"];
    });
});

SPEC_END