#import "PlumberFixLeakJob.h"


@interface PlumberFixLeakJob ()

@property (strong, nonatomic) Plumber *plumber;

@end


@implementation PlumberFixLeakJob

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
    return [self.plumber fixLeak];
}

@end
