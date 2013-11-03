#import "InsertCoinState.h"
#import "DonkeyKongArcade.h"


@interface InsertCoinState ()

@property (strong, nonatomic) DonkeyKongArcade *donkeyKongArcade;

@end


@implementation InsertCoinState

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
    self.donkeyKongArcade.state = self.donkeyKongArcade.gameReadyState;
    
    return @"A quarter was inserted!\n";
}

- (NSString *)pressStart
{
    return @"Please insert coin!\n";
}

- (NSString *)playGame
{
    return @"Cannot play game until game starts!\n";
}

@end
