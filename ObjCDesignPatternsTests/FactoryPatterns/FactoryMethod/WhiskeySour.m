#import "Kiwi.h"
#import "WhiskeySour.h"
#import "NSLogWrapper.h"


@interface Beverage ()

@property (strong, nonatomic) NSLogWrapper *logWrapper;

@end


SPEC_BEGIN(WhiskeySourSpec)

describe(@"WhiskeySour", ^{
    __block WhiskeySour *whiskeySour;
    
    beforeEach(^{
        whiskeySour = [[WhiskeySour alloc] init];
    });
    
    it(@"is not nil", ^{
        [whiskeySour shouldNotBeNil];
    });
    
    it(@"is named Whiskey Sour", ^{
        [[whiskeySour.name should] equal:@"Whiskey Sour"];
    });
    
    context(@"#prepare (method override)", ^{
        it(@"logs proper message", ^{
            [[whiskeySour.logWrapper should] receive:@selector(log:) withArguments:@"Preparing whiskey sour..."];
            [whiskeySour prepare];
        });
    });
    
    context(@"#pour (method override)", ^{
        it(@"logs proper message", ^{
            [[whiskeySour.logWrapper should] receive:@selector(log:) withArguments:@"Pouring whiskey sour!"];
            [whiskeySour pour];
        });
    });
});

SPEC_END