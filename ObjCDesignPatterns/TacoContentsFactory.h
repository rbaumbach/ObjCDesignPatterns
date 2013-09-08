#import "Tortilla.h"
#import "Carne.h"
#import "Queso.h"
#import "Salsa.h"


@protocol TacoContentsFactory <NSObject>

- (Tortilla *)createTortilla;
- (Carne *)createCarne;
- (Queso *)createQueso;
- (Salsa *)createSalsa;
- (NSArray *)createVeduras;
- (NSArray *)createExtras;

@end
