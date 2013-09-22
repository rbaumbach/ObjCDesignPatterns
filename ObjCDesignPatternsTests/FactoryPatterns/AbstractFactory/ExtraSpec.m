#import "Kiwi.h"
#import "Extra.h"


SPEC_BEGIN(ExtraSpec)

describe(@"Extra", ^{
    __block Extra *extra;
    
    beforeEach(^{
        extra = [[Extra alloc] init];
        extra.name = @"sugar free gum";
    });
    
    it(@"is not nil", ^{
        [extra shouldNotBeNil];
    });
    
    it(@"has a name property", ^{
        [[extra.name should] equal:@"sugar free gum"];
    });
});

SPEC_END