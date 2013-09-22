#import "Beverage.h"
#import "NSLogWrapper.h"


@interface Beverage ()

@property (strong, nonatomic) NSLogWrapper *logWrapper;

@end


@implementation Beverage

- (id)init
{
    self = [super init];
    if (self) {
        self.logWrapper = [[NSLogWrapper alloc] init];
    }
    return self;
}

- (void)prepare
{
    [self.logWrapper log:@"Preparing beverage..."];
}

- (void)pour
{
    [self.logWrapper log:@"Pouring beverage!"];
}

@end
