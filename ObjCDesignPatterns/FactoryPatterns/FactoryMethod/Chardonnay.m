#import "Chardonnay.h"
#import "NSLogWrapper.h"


@interface Chardonnay ()

@property (strong, nonatomic) NSLogWrapper *logWrapper;

@end


@implementation Chardonnay

#pragma mark - Init Methods

- (id)init
{
    self = [super init];
    if (self) {
        self.name = @"Chardonnay";
    }
    return self;
}

#pragma mark - Beverage Methods

- (void)prepare
{
    [self.logWrapper log:@"Preparing chardonnay..."];
}

- (void)pour
{
    [self.logWrapper log:@"Pouring chardonnay!"];
}

@end
