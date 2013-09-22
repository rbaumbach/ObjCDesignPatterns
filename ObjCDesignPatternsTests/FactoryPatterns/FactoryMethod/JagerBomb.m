#import "Kiwi.h"
#import "JagerBomb.h"
#import "NSLogWrapper.h"

@interface  Beverage ()

@property (strong, nonatomic) NSLogWrapper *logWrapper;

@end


SPEC_BEGIN(JagerBombSpec)

describe(@"JagerBomb", ^{
    __block JagerBomb *jagerBomb;
    
    beforeEach(^{
        jagerBomb = [[JagerBomb alloc] init];
    });
    
    it(@"is not nil", ^{
        [jagerBomb shouldNotBeNil];
    });
    
    it(@"is named Jager Bomb", ^{
        [[jagerBomb.name should] equal:@"Jager Bomb"];
    });
    
    context(@"#prepare (method override)", ^{
        it(@"logs proper message", ^{
            [[jagerBomb.logWrapper should] receive:@selector(log:) withArguments:@"Preparing jager bomb..."];
            [jagerBomb prepare];
        });
    });
    
    context(@"#pour (method override)", ^{
        it(@"logs proper message", ^{
            [[jagerBomb.logWrapper should] receive:@selector(log:) withArguments:@"Pouring jager bomb!"];
            [jagerBomb pour];
        });
    });
});

SPEC_END