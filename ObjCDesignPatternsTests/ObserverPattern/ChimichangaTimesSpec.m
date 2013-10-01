#import "Kiwi.h"
#import "ChimichangaTimes.h"
#import "NewsReporter.h"
#import "Observer.h"
#import "Swizzlean.h"

@interface ChimichangaTimes ()

@property (strong, nonatomic) id<NewsReporter> newsReporter;
@property (strong, nonatomic) NSString *newsHeader;

@end


SPEC_BEGIN(ChimichangaTimesSpec)

describe(@"ChimichangaTimes", ^{
    __block ChimichangaTimes *chimichangaTimes;
    
    beforeEach(^{
        chimichangaTimes = [[ChimichangaTimes alloc] init];
    });
    
    it(@"conforms to <Observer>", ^{
        [[chimichangaTimes should] conformToProtocol:@protocol(Observer)];
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
        beforeEach(^{
            [chimichangaTimes update:@"Deep fried burritos are better than beer!!!"];
        });
        
        it(@"sets the news header", ^{
            [[chimichangaTimes.newsHeader should] equal:@"Deep fried burritos are better than beer!!!"];
        });
    });
});

SPEC_END

