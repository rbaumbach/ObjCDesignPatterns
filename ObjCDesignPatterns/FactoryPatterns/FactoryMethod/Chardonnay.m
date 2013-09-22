#import "Chardonnay.h"
#import "NSLogWrapper.h"


@interface Chardonnay ()

@property (strong, nonatomic) NSLogWrapper *logWrapper;

@end


@implementation Chardonnay

- (id)init
{
    self = [super init];
    if (self) {
        self.name = @"Chardonnay";
    }
    return self;
}

- (void)prepare
{
    [self.logWrapper log:@"Preparing chardonnay..."];
}

- (void)pour
{
    [self.logWrapper log:@"Pouring chardonnay!"];
}

@end
