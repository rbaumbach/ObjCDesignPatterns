#import "NSLogWrapper.h"


@implementation NSLogWrapper

#pragma mark - Public Methods

- (void)log:(NSString *)logMessage
{
    NSLog(@"%@", logMessage);
}

@end
