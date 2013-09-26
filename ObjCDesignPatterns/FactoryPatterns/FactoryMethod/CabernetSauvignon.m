#import "CabernetSauvignon.h"
#import "NSLogWrapper.h"


@interface  Beverage ()

@property (strong, nonatomic) NSLogWrapper *logWrapper;

@end


@implementation CabernetSauvignon

#pragma mark - Init Methods

- (id)init
{
    self = [super init];
    if (self) {
        self.name = @"Cabernet Sauvignon";
    }
    return self;
}

#pragma mark - Beverage Methods

- (void)prepare
{
    [self.logWrapper log:@"Preparing cabernet sauvignon..."];
}

- (void)pour
{
    [self.logWrapper log:@"Pouring cabernet sauvignon!"];
}

@end
