#import "Kiwi.h"
#import "GameInProgressState.h"
#import "GameReadyState.h"
#import "InsertCoinState.h"
#import "DonkeyKongArcade.h"
#import "State.h"


@interface GameInProgressState ()

@property (strong, nonatomic) DonkeyKongArcade *donkeyKongArcade;

@end


SPEC_BEGIN(GameInProgressStateSpec)

describe(@"GameInProgressState", ^{
    __block GameInProgressState *gameInProgressState;
    __block DonkeyKongArcade *fakeDonkeyKongArcade;
    
    beforeEach(^{
        fakeDonkeyKongArcade = [DonkeyKongArcade mock];
        gameInProgressState = [[GameInProgressState alloc] initWithDonkeyKongArcade:fakeDonkeyKongArcade];
    });
    
    it(@"has a donkeyKongArcade", ^{
        [fakeDonkeyKongArcade shouldNotBeNil];
    });
    
    context(@"<State>", ^{
        context(@"#insertCoin", ^{
            it(@"returns 'A quarter was inserted!\n' while incrementing the coin count and setting the state to gameReadyState", ^{
                [[gameInProgressState.donkeyKongArcade should] receive:@selector(coinCount)
                                                             andReturn:theValue(0)];
                [[gameInProgressState.donkeyKongArcade should] receive:@selector(setCoinCount:)
                                                         withArguments:theValue(1)];
                
                NSString *insertText = [gameInProgressState insertCoin];
                [[insertText should] equal:@"A quarter was inserted!\n"];
            });
        });
        
        context(@"#pressStart", ^{
            it(@"returns 'Game is already in progress!\n'", ^{
                NSString *startText = [gameInProgressState pressStart];
                [[startText should] equal:@"Game is already in progress!\n"];
            });
        });
        
        context(@"#playGame", ^{
            context(@"donkeyKongArcade has coins", ^{
                __block GameReadyState *fakeGameReadyState;
                
                beforeEach(^{
                    fakeGameReadyState = [KWMock mockForProtocol:@protocol(State)];
                    [[gameInProgressState.donkeyKongArcade should] receive:@selector(coinCount)
                                                                 andReturn:theValue(5)];
                });
                
                it(@"sets the state to gameReadyState", ^{
                    [[gameInProgressState.donkeyKongArcade should] receive:@selector(gameReadyState)
                                                                 andReturn:fakeGameReadyState];
                    [[gameInProgressState.donkeyKongArcade should] receive:@selector(setState:)
                                                             withArguments:fakeGameReadyState];
                    [gameInProgressState playGame];
                });
                
                it(@"returns 'Playing game...  3 lives... 2 lives... 1 life... Game is over!\n'", ^{
                    [[gameInProgressState.donkeyKongArcade should] receive:@selector(gameReadyState)
                                                                 andReturn:fakeGameReadyState];
                    [[gameInProgressState.donkeyKongArcade should] receive:@selector(setState:)
                                                             withArguments:fakeGameReadyState];
                    NSString *playText = [gameInProgressState playGame];
                    
                    [[playText should] equal:@"Playing game...  3 lives... 2 lives... 1 life... Game is over!\n"];
                });
            });
            
            context(@"donkeyKongArcade has NO coins", ^{
                __block GameReadyState *insertCoinState;
                
                beforeEach(^{
                    insertCoinState = [KWMock mockForProtocol:@protocol(State)];
                    [[gameInProgressState.donkeyKongArcade should] receive:@selector(coinCount)
                                                                 andReturn:theValue(0)];
                });
                
                it(@"sets the state to gameReadyState", ^{
                    [[gameInProgressState.donkeyKongArcade should] receive:@selector(insertCoinState)
                                                                 andReturn:insertCoinState];
                    [[gameInProgressState.donkeyKongArcade should] receive:@selector(setState:)
                                                             withArguments:insertCoinState];
                    [gameInProgressState playGame];
                });
                
                it(@"returns 'Playing game...  3 lives... 2 lives... 1 life... Game is over!\n'", ^{
                    [[gameInProgressState.donkeyKongArcade should] receive:@selector(insertCoinState)
                                                                 andReturn:insertCoinState];
                    [[gameInProgressState.donkeyKongArcade should] receive:@selector(setState:)
                                                             withArguments:insertCoinState];
                    NSString *playText = [gameInProgressState playGame];
                    
                    [[playText should] equal:@"Playing game...  3 lives... 2 lives... 1 life... Game is over!\n"];
                });
            });
        });
    });
});

SPEC_END