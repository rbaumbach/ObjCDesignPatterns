#import "Lager.h"
#import "NSLogWrapper.h"


@interface Beverage ()

@property (strong, nonatomic) NSLogWrapper *logWrapper;

@end


@implementation Lager

- (id)init
{
    self = [super init];
    if (self) {
        self.name = @"Lager";
    }
    return self;
}

- (void)prepare
{
    [self.logWrapper log:@"Preparing lager..."];
}

- (void)pour
{
    [self.logWrapper log:@"Pouring lager!"];
}

@end
