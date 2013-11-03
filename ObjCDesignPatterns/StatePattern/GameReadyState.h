#import "State.h"
#import "DonkeyKongArcade.h"


@interface GameReadyState : NSObject <State>

- (id)initWithDonkeyKongArcade:(DonkeyKongArcade *)donkeyKongArcade;

@end
