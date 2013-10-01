#import "Observer.h"

@protocol NewsReporter <NSObject>

- (void)registerObserver:(id<Observer>)observer;
- (void)removeObserver:(id<Observer>)observer;
- (void)notifyObservers;

@end
