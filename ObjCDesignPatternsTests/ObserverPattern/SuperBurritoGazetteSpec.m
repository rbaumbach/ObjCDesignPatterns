#import "Kiwi.h"
#import "SuperBurritoGazette.h"
#import "NewsReporter.h"
#import "Observer.h"
#import "Swizzlean.h"

@interface SuperBurritoGazette ()

@property (strong, nonatomic) id<NewsReporter> newsReporter;
@property (strong, nonatomic) NSString *newsHeader;

@end


SPEC_BEGIN(SuperBurritoGazetteSpec)

describe(@"SuperBurritoGazette", ^{
    __block SuperBurritoGazette *superBurritoGazette;
    
    beforeEach(^{
        superBurritoGazette = [[SuperBurritoGazette alloc] init];
    });
    
    it(@"conforms to <Observer>", ^{
        [[superBurritoGazette should] conformToProtocol:@protocol(Observer)];
    });
    
    context(@"#initWithNewsReporter", ^{
        it(@"registers itself as an observer of the NewsReporter passed in", ^{
            id fakeNewsReporter = [KWMock nullMockForProtocol:@protocol(Observer)];
            [[fakeNewsReporter should] receive:@selector(registerObserver:)];
            
            SuperBurritoGazette *supers = [[SuperBurritoGazette alloc] initWithNewsReporter:fakeNewsReporter];
            [[(NSObject *)supers.newsReporter should] equal:fakeNewsReporter];
        });
    });
    
    context(@"#update:", ^{
        beforeEach(^{
            [superBurritoGazette update:@"Everybody loves a super burrito!!!"];
        });
        
        it(@"sets the news header", ^{
            [[superBurritoGazette.newsHeader should] equal:@"Everybody loves a super burrito!!!"];
        });
    });
});

SPEC_END

