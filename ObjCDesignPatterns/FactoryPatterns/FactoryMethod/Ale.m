#import "Ale.h"
#import "NSLogWrapper.h"

@interface Beverage ()

@property (strong, nonatomic) NSLogWrapper *logWrapper;

@end


@implementation Ale

#pragma mark - Init Methods

- (id)init
{
    self = [super init];
    if (self) {
        self.name = @"Ale";
    }
    return self;
}

#pragma mark - Beverage Methods

- (void)prepare
{
    [self.logWrapper log:@"Preparing ale..."];
}

- (void)pour
{
    [self.logWrapper log:@"Pouring ale!"];
}

@end
