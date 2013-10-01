#import "Kiwi.h"
#import "BurritoReporter.h"


@interface BurritoReporter ()

@property (strong, nonatomic) NSMutableArray *observers;

@end


SPEC_BEGIN(BurritoReporterSpec)

describe(@"BurritoReporter", ^{
    __block BurritoReporter *burritoReporter;
    
    beforeEach(^{
        burritoReporter = [[BurritoReporter alloc] init];
    });
    
    it(@"conforms to Subject protocol", ^{
        [[burritoReporter should] conformToProtocol:@protocol(NewsReporter)];
    });
    
    it(@"has an array of observers", ^{
        [burritoReporter.observers shouldNotBeNil];
    });
    
    context(@"headline property", ^{
        context(@"#headline", ^{
            beforeEach(^{
                burritoReporter.headline = @"Burritos are the best";
            });
            
            it(@"gets the headline", ^{
                NSString *headline = burritoReporter.headline;
                [[headline should] equal:@"Burritos are the best"];
            });
        });
        
        context(@"#setHeadline:", ^{
            it(@"sets the headline", ^{
                [[burritoReporter should] receive:@selector(notifyObservers)];
                burritoReporter.headline = @"Burritos are better than the best";
                [[burritoReporter.headline should] equal:@"Burritos are better than the best"];
            });
        });
    });
    
    context(@"#registerObserver:", ^{
        __block id<Observer> fakeObserver;
        
        beforeEach(^{
            fakeObserver = [KWMock mockForProtocol:@protocol(Observer)];
            [burritoReporter registerObserver:fakeObserver];
        });
        
        it(@"adds observer to observer list", ^{
            [[burritoReporter.observers should] contain:fakeObserver];
        });
    });
    
    context(@"#removeObserver:", ^{
        __block id<Observer> fakeObserver;

        beforeEach(^{
            fakeObserver = [KWMock mockForProtocol:@protocol(Observer)];
            [burritoReporter.observers addObject:fakeObserver];
            [burritoReporter removeObserver:fakeObserver];
        });
        
        it(@"adds observer to observer list", ^{
            [[burritoReporter.observers shouldNot] contain:fakeObserver];
        });
    });
    
    context(@"#notifyObservers", ^{
        it(@"notifies observers by calling update:", ^{
            id<Observer> fakeObserverUno = [KWMock mockForProtocol:@protocol(Observer)];
            id<Observer> fakeObserverDos = [KWMock mockForProtocol:@protocol(Observer)];
            id<Observer> fakeObserverTres = [KWMock mockForProtocol:@protocol(Observer)];
            
            burritoReporter.observers = [@[fakeObserverUno, fakeObserverDos, fakeObserverTres] mutableCopy];
            
            [[(NSObject *)fakeObserverUno should] receive:@selector(update:) withArguments:@"Updated Text!"];
            [[(NSObject *)fakeObserverDos should] receive:@selector(update:) withArguments:@"Updated Text!"];
            [[(NSObject *)fakeObserverTres should] receive:@selector(update:) withArguments:@"Updated Text!"];
            [burritoReporter notifyObservers];
        });
    });
});

SPEC_END

