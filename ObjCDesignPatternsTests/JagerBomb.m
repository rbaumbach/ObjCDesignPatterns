#import "Kiwi.h"
#import "JagerBomb.h"


SPEC_BEGIN(JagerBombSpec)

describe(@"JagerBomb", ^{
    __block JagerBomb *jagerBomb;
    
    beforeEach(^{
        jagerBomb = [[JagerBomb alloc] init];
    });
    
    it(@"is not nil", ^{
        [jagerBomb shouldNotBeNil];
    });
});

SPEC_END