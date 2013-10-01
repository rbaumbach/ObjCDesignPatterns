#import "BurritoReporter.h"


@interface BurritoReporter ()

@property (strong, nonatomic) NSMutableArray *observers;

@end


@implementation BurritoReporter

@synthesize headline = _headline;

#pragma mark - Init Methods

- (id)init
{
    self = [super init];
    if (self) {
        self.observers = [@[] mutableCopy];
    }
    return self;
}

#pragma mark - Public Methods

- (void)setHeadline:(NSString *)headline
{
    _headline = headline;
    [self notifyObservers];
}

- (NSString *)headline
{
    return _headline;
}

#pragma mark - <NewsReporter>

- (void)registerObserver:(id<Observer>)observer
{
    [self.observers addObject:observer];
}

- (void)removeObserver:(id<Observer>)observer
{
    [self.observers removeObject:observer];
}

- (void)notifyObservers
{
    for (id<Observer> observer in self.observers) {
        [observer update:@"Updated Text!"];
    }
}

@end
