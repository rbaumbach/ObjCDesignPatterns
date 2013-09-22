#import "Kiwi.h"
#import "Lager.h"
#import "NSLogWrapper.h"


@interface Beverage ()

@property (strong, nonatomic) NSLogWrapper *logWrapper;

@end


SPEC_BEGIN(LagerSpec)

describe(@"Lager", ^{
    __block Lager *lager;
    
    beforeEach(^{
        lager = [[Lager alloc] init];
    });
    
    it(@"is not nil", ^{
        [lager shouldNotBeNil];
    });
    
    it(@"is named Lager", ^{
        [[lager.name should] equal:@"Lager"];
    });
    
    context(@"#prepare (method override)", ^{
        it(@"logs proper message", ^{
            [[lager.logWrapper should] receive:@selector(log:) withArguments:@"Preparing lager..."];
            [lager prepare];
        });
    });
    
    context(@"#pour (method override)", ^{
        it(@"logs proper message", ^{
            [[lager.logWrapper should] receive:@selector(log:) withArguments:@"Pouring lager!"];
            [lager pour];
        });
    });
});

SPEC_END