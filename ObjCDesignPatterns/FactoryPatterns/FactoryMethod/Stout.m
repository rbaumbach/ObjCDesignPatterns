#import "Stout.h"
#import "NSLogWrapper.h"


@interface Beverage ()

@property (strong, nonatomic) NSLogWrapper *logWrapper;

@end


@implementation Stout

- (id)init
{
    self = [super init];
    if (self) {
        self.name = @"Stout";
    }
    return self;
}

- (void)prepare
{
    [self.logWrapper log:@"Preparing stout..."];
}

- (void)pour
{
    [self.logWrapper log:@"Pouring stout!"];
}

@end
