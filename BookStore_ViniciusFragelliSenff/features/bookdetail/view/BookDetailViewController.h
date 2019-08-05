//
//  BookDetailViewController.h
//  BookStore_ViniciusFragelliSenff
//
//  Created by MacInBox on 03/08/19.
//  Copyright © 2019 ViniciusFragelli. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BookVO;

NS_ASSUME_NONNULL_BEGIN

@interface BookDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblSubTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblAuthor;
@property (weak, nonatomic) IBOutlet UILabel *lblDescription;
@property (weak, nonatomic) IBOutlet UIView *viewTitle;
@property (weak, nonatomic) IBOutlet UIView *viewSubTitle;
@property (weak, nonatomic) IBOutlet UIView *viewAuthor;
@property (weak, nonatomic) IBOutlet UIView *viewDesc;
@property (weak, nonatomic) IBOutlet UIButton *btnBuy;
@property (weak, nonatomic) IBOutlet UIView *viewBuy;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constBtn;

@property (nonatomic) BookVO *book;

@end

NS_ASSUME_NONNULL_END
