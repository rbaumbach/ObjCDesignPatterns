#import "WhiskeySour.h"
#import "NSLogWrapper.h"


@interface Beverage ()

@property (strong, nonatomic) NSLogWrapper *logWrapper;

@end


@implementation WhiskeySour

- (id)init
{
    self = [super init];
    if (self) {
        self.name = @"Whiskey Sour";
    }
    return self;
}

- (void)prepare
{
    [self.logWrapper log:@"Preparing whiskey sour..."];
}

- (void)pour
{
    [self.logWrapper log:@"Pouring whiskey sour!"];
}

@end
