#import "RatAdapter.h"


@interface RatAdapter ()

@property (strong, nonatomic) id<Rat> rat;

@end


@implementation RatAdapter

- (id)initWithRat:(id<Rat>)rat
{
    self = [super init];
    if (self) {
        self.rat = rat;
    }
    return self;
}

- (NSString *)quack
{
    return [self.rat squeak];
}

- (NSString *)walk
{
    return [self.rat runAround];
}

- (NSString *)swim
{
    return [self.rat swim];
}

- (NSString *)fly
{
    return [self.rat flyWithSuperFlightSuit];
}

@end
