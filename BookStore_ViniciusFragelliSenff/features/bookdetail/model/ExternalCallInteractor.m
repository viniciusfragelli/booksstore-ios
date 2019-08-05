//
//  BookDetailPresenter.m
//  BookStore_ViniciusFragelliSenff
//
//  Created by MacInBox on 04/08/19.
//  Copyright © 2019 ViniciusFragelli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ExternalCallInteractor.h"
#import "AppDelegate.h"


@implementation ExternalCallInteractor


-(void)openURL: (NSString*) url {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}

@end
