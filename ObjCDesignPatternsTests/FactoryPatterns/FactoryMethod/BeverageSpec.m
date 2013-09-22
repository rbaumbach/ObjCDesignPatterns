#import "Kiwi.h"
#import "Beverage.h"
#import "NSLogWrapper.h"


@interface Beverage ()

@property (strong, nonatomic) NSLogWrapper *logWrapper;

@end


SPEC_BEGIN(BeverageSpec)

describe(@"Beverage", ^{
    __block Beverage *beverage;
    
    beforeEach(^{
        beverage = [[Beverage alloc] init];
        beverage.name = @"BitterBeer";
    });
    
    it(@"has a name", ^{
        [[beverage.name should] equal:@"BitterBeer"];
    });
    
    it(@"has a log wrapper", ^{
        [beverage.logWrapper shouldNotBeNil];
    });
    
    context(@"#prepare", ^{
        it(@"logs proper message", ^{
            [[beverage.logWrapper should] receive:@selector(log:) withArguments:@"Preparing beverage..."];
            [beverage prepare];
        });
    });
    
    context(@"#pour", ^{
        it(@"logs proper message", ^{
            [[beverage.logWrapper should] receive:@selector(log:) withArguments:@"Pouring beverage!"];
            [beverage pour];
        });
    });
});

SPEC_END