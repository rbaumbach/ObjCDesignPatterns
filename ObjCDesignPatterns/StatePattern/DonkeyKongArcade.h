#import "State.h"


@interface DonkeyKongArcade : NSObject

@property (strong, nonatomic, readonly) id<State> insertCoinState;
@property (strong, nonatomic, readonly) id<State> gameReadyState;
@property (strong, nonatomic, readonly) id<State> gameInProgressState;

@property (strong, nonatomic) id<State> state;

@property (nonatomic) NSInteger  coinCount;

- (NSString *)insertCoin;
- (NSString *)pressStart;
- (NSString *)playGame;

@end
