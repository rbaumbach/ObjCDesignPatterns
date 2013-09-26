#import "RumAndCoke.h"
#import "NSLogWrapper.h"


@interface  Beverage ()

@property (strong, nonatomic) NSLogWrapper *logWrapper;

@end


@implementation RumAndCoke

#pragma mark - Init Methods

- (id)init
{
    self = [super init];
    if (self) {
        self.name = @"Rum and Coke";
    }
    return self;
}

#pragma mark - Beverage Methods

- (void)prepare
{
    [self.logWrapper log:@"Preparing rum and coke..."];
}

- (void)pour
{
    [self.logWrapper log:@"Pouring rum and coke!"];
}

@end
