#import "CabernetSauvignon.h"
#import "NSLogWrapper.h"


@interface  Beverage ()

@property (strong, nonatomic) NSLogWrapper *logWrapper;

@end


@implementation CabernetSauvignon

- (id)init
{
    self = [super init];
    if (self) {
        self.name = @"Cabernet Sauvignon";
    }
    return self;
}

- (void)prepare
{
    [self.logWrapper log:@"Preparing cabernet sauvignon..."];
}

- (void)pour
{
    [self.logWrapper log:@"Pouring cabernet sauvignon!"];
}

@end
