#import "State.h"
#import "DonkeyKongArcade.h"


@interface InsertCoinState : NSObject <State>

- (id)initWithDonkeyKongArcade:(DonkeyKongArcade *)donkeyKongArcade;

@end
