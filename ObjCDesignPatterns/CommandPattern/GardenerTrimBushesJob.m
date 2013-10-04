#import "GardenerTrimBushesJob.h"


@interface GardenerTrimBushesJob ()

@property (strong, nonatomic) Gardener *gardener;

@end


@implementation GardenerTrimBushesJob

#pragma mark - Init Methods

- (id)initWithGardener:(Gardener *)gardener
{
    self = [super init];
    if (self) {
        self.gardener = gardener;
    }
    return self;
}

#pragma mark - <Job>

- (NSString *)execute
{
    return [self.gardener trimBushes];
}

@end
