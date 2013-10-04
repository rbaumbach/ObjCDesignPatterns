#import "Kiwi.h"
#import "Plumber.h"


SPEC_BEGIN(PlumberSpec)

describe(@"Plumber", ^{
    __block Plumber *plumber;
    
    beforeEach(^{
        plumber = [[Plumber alloc] init];
    });
    
    it(@"is not nil", ^{
        [plumber shouldNotBeNil];
    });
    
    context(@"#fixLeak", ^{
        __block NSString *leakFixed;
        
        beforeEach(^{
            leakFixed = [plumber fixLeak];
        });
        
        it(@"returns 'Plumber fixed leak!'", ^{
            [[leakFixed should] equal:@"Plumber fixed leak!"];
        });
    });
    
    context(@"#unclogDrain", ^{
        __block NSString *uncloggedDrain;
        
        beforeEach(^{
            uncloggedDrain = [plumber unclogDrain];
        });
        
        it(@"returns 'Plumber unclogged drain!'", ^{
            [[uncloggedDrain should] equal:@"Plumber unclogged drain!"];
        });
    });
});

SPEC_END