//
//  BookDetailPresenter.m
//  BookStore_ViniciusFragelliSenff
//
//  Created by MacInBox on 04/08/19.
//  Copyright © 2019 ViniciusFragelli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BookDetailPresenter.h"
#import "ExternalCallInteractor.h"
#import "StorageInteractor.h"
#import "BookStore_ViniciusFragelliSenff-Swift.h"

@implementation BookDetailPresenter

ExternalCallInteractor *externalInteractor;
StorageInteractor *storageInteractor;

-(void)setup: (BookVO*) book {
    externalInteractor = [ExternalCallInteractor alloc];
    storageInteractor = [StorageInteractor alloc];
    _book = book;
    [self verifyIsFavorite:book.id];
}

-(void)openURL: (NSString*) url {
    [externalInteractor openURL:url];
}

-(BOOL)verifyIsFavorite: (NSString*) idBook {
    _isFavorite = [storageInteractor verifyIsFavorite:idBook];
    return _isFavorite;
}

-(void)checkFavorite {
    _isFavorite = !_isFavorite;
    if(_isFavorite){
        [storageInteractor addFavorite:_book];
    }else{
        [storageInteractor removeFavorite:_book];
    }
    
}

@end
