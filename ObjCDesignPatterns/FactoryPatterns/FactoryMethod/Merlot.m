#import "Merlot.h"
#import "NSLogWrapper.h"


@interface Beverage ()

@property (strong, nonatomic) NSLogWrapper *logWrapper;

@end


@implementation Merlot

- (id)init
{
    self = [super init];
    if (self) {
        self.name = @"Merlot";
    }
    return self;
}

- (void)prepare
{
    [self.logWrapper log:@"Preparing merlot..."];
}

- (void)pour
{
    [self.logWrapper log:@"Pouring merlot!"];
}

@end
