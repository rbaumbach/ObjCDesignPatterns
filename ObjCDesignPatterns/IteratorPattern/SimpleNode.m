#import "SimpleNode.h"


@implementation SimpleNode

- (id)initWithItem:(id)item
{
    self = [super init];
    if (self) {
        self.item = item;
    }
    return self;
}

@end
