@class BookVO;

@interface StorageInteractor : NSObject

-(BOOL)verifyIsFavorite: (NSString*) idBook;
-(void)addFavorite: (BookVO*) book;
-(void)removeFavorite: (BookVO*) book;

@end
