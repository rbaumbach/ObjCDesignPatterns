#import "Kiwi.h"
#import "InsertCoinState.h"
#import "DonkeyKongArcade.h"
#import "State.h"


@interface InsertCoinState ()

@property (strong, nonatomic) DonkeyKongArcade *donkeyKongArcade;

@end


SPEC_BEGIN(InsertCoinStateSpec)

describe(@"InsertCoinState", ^{
    __block InsertCoinState *insertCoinState;
    __block DonkeyKongArcade *fakeDonkeyKongArcade;
    
    beforeEach(^{
        fakeDonkeyKongArcade = [DonkeyKongArcade mock];
        insertCoinState = [[InsertCoinState alloc] initWithDonkeyKongArcade:fakeDonkeyKongArcade];
    });
    
    it(@"has a donkeyKongArcade", ^{
        [fakeDonkeyKongArcade shouldNotBeNil];
    });
    
    context(@"<State>", ^{
        context(@"#insertCoin", ^{
            it(@"returns 'A quarter was inserted!\n' while incrementing the coin count and setting the state to gameReadyState", ^{
                id<State> fakeGameReadyState = [KWMock mockForProtocol:@protocol(State)];
                [[insertCoinState.donkeyKongArcade should] receive:@selector(coinCount) andReturn:theValue(0)];
                [[insertCoinState.donkeyKongArcade should] receive:@selector(setCoinCount:) withArguments:theValue(1)];
                [[insertCoinState.donkeyKongArcade should] receive:@selector(gameReadyState) andReturn:fakeGameReadyState];
                [[insertCoinState.donkeyKongArcade should] receive:@selector(setState:) withArguments:fakeGameReadyState];
                
                NSString *insertText = [insertCoinState insertCoin];
                [[insertText should] equal:@"A quarter was inserted!\n"];
            });
        });
        
        context(@"#pressStart", ^{
            it(@"returns 'Please insert coin!\n'", ^{
                NSString *startText = [insertCoinState pressStart];
                [[startText should] equal:@"Please insert coin!\n"];
            });
        });
        
        context(@"#playGame", ^{
            it(@"returns 'Cannot play game until game starts!\n'", ^{
                NSString *gameText = [insertCoinState playGame];
                [[gameText should] equal:@"Cannot play game until game starts!\n"];
            });
        });
    });
});

SPEC_END