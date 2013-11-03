#import "Kiwi.h"
#import "Swizzlean.h"
#import "DonkeyKongArcade.h"
#import "InsertCoinState.h"
#import "GameReadyState.h"
#import "GameInProgressState.h"


@interface DonkeyKongArcade ()

@property (strong, nonatomic, readwrite) id<State> insertCoinState;
@property (strong, nonatomic, readwrite) id<State> gameReadyState;
@property (strong, nonatomic, readwrite) id<State> gameInProgressState;

@end


SPEC_BEGIN(DonkeyKongArcadeSpec)

describe(@"DonkeyKongArcade", ^{
    __block DonkeyKongArcade *donkeyKongArcade;
    
    beforeEach(^{
        donkeyKongArcade = [[DonkeyKongArcade alloc] init];
    });

    context(@"#init", ^{
        __block Swizzlean *insertCoinSwizz;
        __block InsertCoinState *fakeInsertCoinState;
        __block DonkeyKongArcade *retDKFromInsertCoin;

        __block Swizzlean *gameReadySwizz;
        __block GameReadyState *fakeGameReadyState;
        __block DonkeyKongArcade *retDKFromGameReady;

        __block Swizzlean *gameInProgressSwizz;
        __block GameInProgressState *fakeGameInProgressState;
        __block DonkeyKongArcade *retDKFromGameInProgress;
        
        beforeEach(^{
            fakeInsertCoinState = [InsertCoinState mock];
            insertCoinSwizz = [[Swizzlean alloc] initWithClassToSwizzle:[InsertCoinState class]];
            [insertCoinSwizz swizzleInstanceMethod:@selector(initWithDonkeyKongArcade:)
                     withReplacementImplementation:^(id _self, DonkeyKongArcade *dkParam) {
                         retDKFromInsertCoin = dkParam;
                         return fakeInsertCoinState;
                     }];
            
            fakeGameReadyState = [GameReadyState mock];
            gameReadySwizz = [[Swizzlean alloc] initWithClassToSwizzle:[GameReadyState class]];
            [gameReadySwizz swizzleInstanceMethod:@selector(initWithDonkeyKongArcade:)
                    withReplacementImplementation:^(id _self, DonkeyKongArcade *dkParam) {
                        retDKFromGameReady = dkParam;
                        return fakeGameReadyState;
                    }];
            
            fakeGameInProgressState = [GameInProgressState mock];
            gameInProgressSwizz = [[Swizzlean alloc] initWithClassToSwizzle:[GameInProgressState class]];
            [gameInProgressSwizz swizzleInstanceMethod:@selector(initWithDonkeyKongArcade:)
                         withReplacementImplementation:^(id _self, DonkeyKongArcade *dkParam) {
                             retDKFromGameInProgress = dkParam;
                             return fakeGameInProgressState;
                         }];
            
            donkeyKongArcade = [[DonkeyKongArcade alloc] init];
        });
        
        afterEach(^{
            [insertCoinSwizz resetSwizzledInstanceMethod];
            [gameReadySwizz resetSwizzledInstanceMethod];
            [gameInProgressSwizz resetSwizzledInstanceMethod];
        });
        
        it(@"has an insertCoinState", ^{
            [[retDKFromInsertCoin should] equal:donkeyKongArcade];
            [[(NSObject *)donkeyKongArcade.insertCoinState should] equal:fakeInsertCoinState];
        });
        
        it(@"has a gameReadyState", ^{
            [[retDKFromGameReady should] equal:donkeyKongArcade];
            [[(NSObject *)donkeyKongArcade.gameReadyState should] equal:fakeGameReadyState];
        });
        
        it(@"has a gameInProgressState", ^{
            [[retDKFromGameInProgress should] equal:donkeyKongArcade];
            [[(NSObject *)donkeyKongArcade.gameInProgressState should] equal:fakeGameInProgressState];
        });
        
        it(@"has an initial state of insertCoin with 0 coins", ^{
            [[(NSObject *)donkeyKongArcade.state should] equal:donkeyKongArcade.insertCoinState];
            [[theValue(donkeyKongArcade.coinCount) should] equal:theValue(0)];
        });
    });
    
    context(@"#insertCoin", ^{
        it(@"calls insertCoin on current state", ^{
            [[(NSObject *)donkeyKongArcade.state should] receive:@selector(insertCoin)
                                                       andReturn:@"insertCoin"];
            NSString *insertCoin = [donkeyKongArcade insertCoin];
            [[insertCoin should] equal:@"insertCoin"];
        });
    });
    
    context(@"#pressStart", ^{
        it(@"calls pressStart on current state", ^{
            [[(NSObject *)donkeyKongArcade.state should] receive:@selector(pressStart)
                                                       andReturn:@"pressStart"];
            NSString *pressStart = [donkeyKongArcade pressStart];
            [[pressStart should] equal:@"pressStart"];
        });
    });
    
    context(@"#playGame", ^{
        it(@"calls playGame on current state", ^{
            [[(NSObject *)donkeyKongArcade.state should] receive:@selector(playGame)
                                                       andReturn:@"playGame"];
            NSString *playGame = [donkeyKongArcade playGame];
            [[playGame should] equal:@"playGame"];
        });
    });
});

SPEC_END