#import "Kiwi.h"
#import "NSLogWrapper.h"


SPEC_BEGIN(NSLogWrapperSpec)

describe(@"FactoryPatternsViewController", ^{
    __block NSLogWrapper *logWrapper;
    
    beforeEach(^{
        logWrapper = [[NSLogWrapper alloc] init];
    });
    
    it(@"is not nil", ^{
        [logWrapper shouldNotBeNil];
    });
    
    it(@"has #log: method", ^{
        [[logWrapper should] respondToSelector:@selector(log:)];
    });
});

SPEC_END