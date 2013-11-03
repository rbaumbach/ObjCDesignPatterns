#import "GameInProgressState.h"
#import "DonkeyKongArcade.h"


@interface GameInProgressState ()

@property (strong, nonatomic) DonkeyKongArcade *donkeyKongArcade;

@end


@implementation GameInProgressState

#pragma mark - Init Methods

- (id)initWithDonkeyKongArcade:(DonkeyKongArcade *)donkeyKongArcade
{
    self = [super init];
    if (self) {
        self.donkeyKongArcade = donkeyKongArcade;
    }
    return self;
}

#pragma mark - <State>

- (NSString *)insertCoin
{
    self.donkeyKongArcade.coinCount++;
    return @"A quarter was inserted!\n";
}

- (NSString *)pressStart
{
    return @"Game is already in progress!\n";
}

- (NSString *)playGame
{
    if (self.donkeyKongArcade.coinCount > 0) {
        self.donkeyKongArcade.state = self.donkeyKongArcade.gameReadyState;
    } else {
        self.donkeyKongArcade.state = self.donkeyKongArcade.insertCoinState;
    }
    
    return @"Playing game...  3 lives... 2 lives... 1 life... Game is over!\n";
}

@end
