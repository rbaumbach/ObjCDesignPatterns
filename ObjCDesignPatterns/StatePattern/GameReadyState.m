#import "GameReadyState.h"
#import "DonkeyKongArcade.h"


@interface GameReadyState ()

@property (strong, nonatomic) DonkeyKongArcade *donkeyKongArcade;

@end


@implementation GameReadyState

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
    self.donkeyKongArcade.coinCount--;
    self.donkeyKongArcade.state = self.donkeyKongArcade.gameInProgressState;
    return @"Game Start!\n";
}

- (NSString *)playGame
{
    return @"Cannot play game until game starts!\n";
}

@end
