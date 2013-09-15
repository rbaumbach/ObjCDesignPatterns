#import "CrunchyTacoStore.h"
#import "CrunchyTacoContentsFactory.h"
#import "BeefTaco.h"
#import "PorkTaco.h"

@interface  CrunchyTacoStore ()

@property (strong, nonatomic) id<TacoContentsFactory> tacoContentsFactory;

@end


@implementation CrunchyTacoStore

- (id)init
{
    self = [super init];
    if (self) {
        self.tacoContentsFactory = [[CrunchyTacoContentsFactory alloc] init];
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
