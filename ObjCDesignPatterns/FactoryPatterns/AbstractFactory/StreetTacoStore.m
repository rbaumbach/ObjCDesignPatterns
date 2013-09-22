#import "StreetTacoStore.h"
#import "StreetTacoContentsFactory.h"
#import "BeefTaco.h"
#import "PorkTaco.h"


@interface  StreetTacoStore ()

@property (strong, nonatomic) id<TacoContentsFactory> tacoContentsFactory;

@end


@implementation StreetTacoStore

- (id)init
{
    self = [super init];
    if (self) {
        self.name = @"Street Taco Store";
        self.tacoContentsFactory = [[StreetTacoContentsFactory alloc] init];
    }
    return self;
}

- (Taco *)createTaco:(NSString *)tacoType
{
    Taco *taco;
    
    if ([tacoType isEqualToString:@"BeefTaco"]) {
        taco = [[BeefTaco alloc] initWithTacoContentsFactory:self.tacoContentsFactory];
    } else if ([tacoType isEqualToString:@"PorkTaco"]) {
        taco = [[PorkTaco alloc] initWithTacoContentsFactory:self.tacoContentsFactory];
    }

    return taco;
}

@end
