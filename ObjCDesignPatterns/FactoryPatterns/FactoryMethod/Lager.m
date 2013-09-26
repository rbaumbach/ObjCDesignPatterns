#import "Lager.h"
#import "NSLogWrapper.h"


@interface Beverage ()

@property (strong, nonatomic) NSLogWrapper *logWrapper;

@end


@implementation Lager

#pragma mark - Init Methods

- (id)init
{
    self = [super init];
    if (self) {
        self.name = @"Lager";
    }
    return self;
}

#pragma mark - Beverage Methods

- (void)prepare
{
    [self.logWrapper log:@"Preparing lager..."];
}

- (void)pour
{
    [self.logWrapper log:@"Pouring lager!"];
}

@end
