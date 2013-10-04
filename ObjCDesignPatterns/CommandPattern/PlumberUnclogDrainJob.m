#import "PlumberUnclogDrainJob.h"


@interface PlumberUnclogDrainJob ()

@property (strong, nonatomic) Plumber *plumber;

@end


@implementation PlumberUnclogDrainJob

#pragma mark - Init Methods

- (id)initWithPlumber:(Plumber *)plumber
{
    self = [super init];
    if (self) {
        self.plumber = plumber;
    }
    return self;
}

#pragma mark - <Job>

- (NSString *)execute
{
    return [self.plumber unclogDrain];
}

@end
