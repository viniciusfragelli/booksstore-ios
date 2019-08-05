//
//  StorageInteractor.m
//  BookStore_ViniciusFragelliSenff
//
//  Created by MacInBox on 05/08/19.
//  Copyright © 2019 ViniciusFragelli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StorageInteractor.h"
#import "BookStore_ViniciusFragelliSenff-Swift.h"

@implementation StorageInteractor


-(BOOL)verifyIsFavorite: (NSString*) idBook {
    return [PrefsUtil verifyIsFavoriteWithId:idBook];
}

-(void)addFavorite: (BookVO*) book {
    [PrefsUtil addBookWithBook:book];
}

-(void)removeFavorite: (BookVO*) book {
    [PrefsUtil removeBookWithBook:book];
}

@end
