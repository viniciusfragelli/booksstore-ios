//
//  BookCollectionViewCell.m
//  BookStore_ViniciusFragelliSenff
//
//  Created by MacInBox on 02/08/19.
//  Copyright © 2019 ViniciusFragelli. All rights reserved.
//

#import "BookCollectionViewCell.h"

@implementation BookCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setupView: (NSString*) title: (NSString*) subtitle: (NSString*) author {
    self.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.layer.shadowOpacity = 0.3;
    NSArray *rows = @[@{@"size" : [NSValue valueWithCGSize:(CGSize){1, 1}]}];
    CGSize size = [rows[0][@"size"] CGSizeValue];
    self.layer.shadowOffset = size;
    self.layer.shadowRadius = 5;
    self.layer.cornerRadius = 4;
    _lblTitle.text = title;
    _lblSubTitle.text = subtitle;
    _lblAuthor.text = author;
}

@end
