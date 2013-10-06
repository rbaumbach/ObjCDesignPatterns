#import "SuperBurritoGazette.h"


@interface SuperBurritoGazette ()

@property (strong, nonatomic) id<NewsReporter> newsReporter;
@property (strong, nonatomic) NSString *newsHeader;

@end


@implementation SuperBurritoGazette

#pragma mark - Init Methods

- (id)initWithNewsReporter:(id<NewsReporter>)newsReporter
{
    self = [super init];
    if (self) {
        self.newsReporter = newsReporter;
        [self.newsReporter registerObserver:self];
    }
    return self;
}

#pragma mark - <Observer>

- (void)update:(NSString *)updateText
{
    self.newsHeader = updateText;
    [self updateCurrentNewsSnippet];
}

#pragma mark - Private Methods

- (void)updateCurrentNewsSnippet
{
    self.snippet = [NSString stringWithFormat:@"%@\n->>>Super Burrito Gazette 2013<<<-\n", self.newsHeader];
}

@end
