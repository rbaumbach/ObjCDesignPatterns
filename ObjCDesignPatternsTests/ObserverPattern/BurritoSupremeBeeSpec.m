#import "Kiwi.h"
#import "BurritoSupremeBee.h"
#import "NewsReporter.h"
#import "Observer.h"
#import "Swizzlean.h"

@interface BurritoSupremeBee ()

@property (strong, nonatomic) id<NewsReporter> newsReporter;
@property (strong, nonatomic) NSString *newsHeader;

- (void)currentNewsSnippet;

@end


SPEC_BEGIN(BurritoSupremeBeeSpec)

describe(@"BurritoSupremeBee", ^{
    __block BurritoSupremeBee *burritoSupremeBee;
    
    beforeEach(^{
        burritoSupremeBee = [[BurritoSupremeBee alloc] init];
    });
    
    it(@"conforms to <Observer>", ^{
        [[burritoSupremeBee should] conformToProtocol:@protocol(Observer)];
    });
    
    context(@"#initWithNewsReporter", ^{
        it(@"registers itself as an observer of the NewsReporter passed in", ^{
            id fakeNewsReporter = [KWMock nullMockForProtocol:@protocol(Observer)];
            [[fakeNewsReporter should] receive:@selector(registerObserver:)];
            
            BurritoSupremeBee *supreme = [[BurritoSupremeBee alloc] initWithNewsReporter:fakeNewsReporter];
            [[(NSObject *)supreme.newsReporter should] equal:fakeNewsReporter];
        });
    });
    
    context(@"#update:", ^{
        it(@"sets the news header", ^{
            [burritoSupremeBee update:@"Supreme is the way to go!!!"];
            [[burritoSupremeBee.newsHeader should] equal:@"Supreme is the way to go!!!"];
        });
        
        it(@"updates snippet", ^{
            [[burritoSupremeBee should] receive:@selector(currentNewsSnippet)];
            [burritoSupremeBee update:@"This doesn't matter"];
        });
    });
    
    context(@"#currentNewsSnippet", ^{
        beforeEach(^{
            burritoSupremeBee.newsHeader = @"Supremeeeemee!!!";
            [burritoSupremeBee currentNewsSnippet];
        });
        
        it(@"returns news snippet", ^{
            NSString *newsSnippet = [NSString stringWithFormat:@"%@\n<-->Super Burrito Bee 2013<-->\n", burritoSupremeBee.newsHeader];
            [[burritoSupremeBee.snippet should] equal:newsSnippet];
        });
    });
});

SPEC_END

