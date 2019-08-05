@class BookVO;

@interface BookDetailPresenter : NSObject

-(void)openURL: (NSString*) url;
-(void)setup: (BookVO*) book;
-(BOOL)verifyIsFavorite: (NSString*) idBook;
-(void)checkFavorite;

@property (nonatomic) BOOL isFavorite;
@property (nonatomic) BookVO *book;

@end
