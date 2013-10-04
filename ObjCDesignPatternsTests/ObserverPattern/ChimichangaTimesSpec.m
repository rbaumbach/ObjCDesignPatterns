#import "Kiwi.h"
#import "ChimichangaTimes.h"
#import "NewsReporter.h"
#import "Observer.h"
#import "Swizzlean.h"

@interface ChimichangaTimes ()

@property (strong, nonatomic) id<NewsReporter> newsReporter;
@property (strong, nonatomic) NSString *newsHeader;

- (void)currentNewsSnippet;

@end


SPEC_BEGIN(ChimichangaTimesSpec)

describe(@"ChimichangaTimes", ^{
    __block ChimichangaTimes *chimichangaTimes;
    
    beforeEach(^{
        chimichangaTimes = [[ChimichangaTimes alloc] init];
        chimichangaTimes.snippet = @"snip";
    });
    
    it(@"conforms to <Observer>", ^{
        [[chimichangaTimes should] conformToProtocol:@protocol(Observer)];
    });
    
    it(@"has snippet property", ^{
        [[chimichangaTimes.snippet should] equal:@"snip"];
    });
    
    context(@"#initWithNewsReporter", ^{
        it(@"registers itself as an observer of the NewsReporter passed in", ^{
            id fakeNewsReporter = [KWMock nullMockForProtocol:@protocol(Observer)];
            [[fakeNewsReporter should] receive:@selector(registerObserver:)];
            
            ChimichangaTimes *chimis = [[ChimichangaTimes alloc] initWithNewsReporter:fakeNewsReporter];
            [[(NSObject *)chimis.newsReporter should] equal:fakeNewsReporter];
        });
    });
    
    context(@"#update:", ^{
        it(@"sets the news header", ^{
            [chimichangaTimes update:@"Deep fried burritos are better than beer!!!"];
            [[chimichangaTimes.newsHeader should] equal:@"Deep fried burritos are better than beer!!!"];
        });
        
        it(@"updates snippet", ^{
            [[chimichangaTimes should] receive:@selector(currentNewsSnippet)];
            [chimichangaTimes update:@"This doesn't matter"];
        });
    });
    
    context(@"#currentNewsSnippet", ^{
        beforeEach(^{
            chimichangaTimes.newsHeader = @"Burritos, now better deep fried!";
            [chimichangaTimes currentNewsSnippet];
        });
        
        it(@"returns news snippet", ^{
            NSString *newsSnippet = [NSString stringWithFormat:@"%@\n~>Chimichanga Times 2013<~\n", chimichangaTimes.newsHeader];
            [[chimichangaTimes.snippet should] equal:newsSnippet];
        });
    });
});

SPEC_END

