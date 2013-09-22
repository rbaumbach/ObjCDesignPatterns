#import "Kiwi.h"
#import "Pork.h"


SPEC_BEGIN(PorkSpec)

describe(@"Pork", ^{
    __block Pork *pork;
    
    beforeEach(^{
        pork = [[Pork alloc] init];
        pork.name = @"0xBBADPORK";
    });
    
    it(@"is not nil", ^{
        [pork shouldNotBeNil];
    });
    
    it(@"has a name property", ^{
        [[pork.name should] equal:@"0xBBADPORK"];
    });
});

SPEC_END