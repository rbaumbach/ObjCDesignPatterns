#import "JagerBomb.h"
#import "NSLogWrapper.h"


@interface Beverage ()

@property (strong, nonatomic) NSLogWrapper *logWrapper;

@end


@implementation JagerBomb

- (id)init
{
    self = [super init];
    if (self) {
        self.name = @"Jager Bomb";
    }
    return self;
}

- (void)prepare
{
    [self.logWrapper log:@"Preparing jager bomb..."];
}

- (void)pour
{
    [self.logWrapper log:@"Pouring jager bomb!"];
}

@end
