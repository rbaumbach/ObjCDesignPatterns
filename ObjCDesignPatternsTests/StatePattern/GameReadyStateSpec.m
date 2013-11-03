#import "Kiwi.h"
#import "GameReadyState.h"
#import "DonkeyKongArcade.h"
#import "State.h"


@interface GameReadyState ()

@property (strong, nonatomic) DonkeyKongArcade *donkeyKongArcade;

@end


SPEC_BEGIN(GameReadyStateSpec)

describe(@"GameReadyState", ^{
    __block GameReadyState *gameReadyState;
    __block DonkeyKongArcade *fakeDonkeyKongArcade;
    
    beforeEach(^{
        fakeDonkeyKongArcade = [DonkeyKongArcade mock];
        gameReadyState = [[GameReadyState alloc] initWithDonkeyKongArcade:fakeDonkeyKongArcade];
    });
    
    it(@"has a donkeyKongArcade", ^{
        [fakeDonkeyKongArcade shouldNotBeNil];
    });
    
    context(@"<State>", ^{
        context(@"#insertCoin", ^{
            it(@"returns 'A quarter was inserted!\n' while incrementing the coin count", ^{
                [[gameReadyState.donkeyKongArcade should] receive:@selector(coinCount) andReturn:theValue(0)];
                [[gameReadyState.donkeyKongArcade should] receive:@selector(setCoinCount:) withArguments:theValue(1)];
                
                NSString *insertText = [gameReadyState insertCoin];
                [[insertText should] equal:@"A quarter was inserted!\n"];
            });
        });
        
        context(@"#pressStart", ^{
            it(@"returns 'Game Start!\n', decrements the coin count and sets the state to gameInProgressState", ^{
                id<State> fakeGameInProgressState = [KWMock mockForProtocol:@protocol(State)];
                [[gameReadyState.donkeyKongArcade should] receive:@selector(coinCount) andReturn:theValue(1)];
                [[gameReadyState.donkeyKongArcade should] receive:@selector(setCoinCount:) withArguments:theValue(0)];
                [[gameReadyState.donkeyKongArcade should] receive:@selector(gameInProgressState) andReturn:fakeGameInProgressState];
                [[gameReadyState.donkeyKongArcade should] receive:@selector(setState:) withArguments:fakeGameInProgressState];
                
                NSString *startText = [gameReadyState pressStart];
                [[startText should] equal:@"Game Start!\n"];
            });
        });
        
        context(@"#playGame", ^{
            it(@"returns 'Cannot play game until game starts!\n'", ^{
                NSString *gameText = [gameReadyState playGame];
                [[gameText should] equal:@"Cannot play game until game starts!\n"];
            });
        });
    });
});

SPEC_END