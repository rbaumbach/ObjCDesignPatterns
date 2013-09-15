#import "Tortilla.h"
#import "Beef.h"
#import "Pork.h"
#import "Queso.h"
#import "Salsa.h"


@protocol TacoContentsFactory <NSObject>

- (Tortilla *)createTortilla;
- (Beef *)createBeef;
- (Pork *)createPork;
- (Queso *)createQueso;
- (Salsa *)createSalsa;
- (NSArray *)createVeduras;
- (NSArray *)createExtras;

@end
