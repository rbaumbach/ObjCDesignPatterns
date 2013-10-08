#import "ExterminatorKillRoachesJob.h"


@interface ExterminatorKillRoachesJob ()

@property (strong, nonatomic) Exterminator *exterminator;

@end


@implementation ExterminatorKillRoachesJob

#pragma mark - Init Methods

- (id)initWithExterminator:(Exterminator *)exterminator
{
    self = [super init];
    if (self) {
        self.exterminator = exterminator;
    }
    return self;
}

#pragma mark - <Job>

- (NSString *)execute
{
    return [self.exterminator killRoaches];
}

@end
