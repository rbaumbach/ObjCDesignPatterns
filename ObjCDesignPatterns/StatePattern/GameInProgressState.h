#import "State.h"
#import "DonkeyKongArcade.h"


@interface GameInProgressState : NSObject <State>

- (id)initWithDonkeyKongArcade:(DonkeyKongArcade *)donkeyKongArcade;

@end
