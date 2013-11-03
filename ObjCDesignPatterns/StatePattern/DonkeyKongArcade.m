#import "DonkeyKongArcade.h"
#import "InsertCoinState.h"
#import "GameReadyState.h"
#import "GameInProgressState.h"


@interface DonkeyKongArcade ()

@property (strong, nonatomic, readwrite) id<State> insertCoinState;
@property (strong, nonatomic, readwrite) id<State> gameReadyState;
@property (strong, nonatomic, readwrite) id<State> gameInProgressState;

@end


@implementation DonkeyKongArcade


#pragma mark - Init Methods

- (id)init
{
    self = [super init];
    if (self) {
        self.insertCoinState = [[InsertCoinState alloc] initWithDonkeyKongArcade:self];
        self.gameReadyState = [[GameReadyState alloc] initWithDonkeyKongArcade:self];
        self.gameInProgressState = [[GameInProgressState alloc] initWithDonkeyKongArcade:self];
        
        self.state = self.insertCoinState;
        self.coinCount = 0;
    }
    return self;
}

#pragma mark - Public Methods

- (NSString *)insertCoin
{
    return [self.state insertCoin];
}

- (NSString *)pressStart
{
    return [self.state pressStart];
}

- (NSString *)playGame
{
    return [self.state playGame];
}

@end
