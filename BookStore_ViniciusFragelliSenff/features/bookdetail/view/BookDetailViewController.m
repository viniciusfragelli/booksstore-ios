//
//  BookDetailViewController.m
//  BookStore_ViniciusFragelliSenff
//
//  Created by MacInBox on 03/08/19.
//  Copyright © 2019 ViniciusFragelli. All rights reserved.
//

#import "BookDetailViewController.h"
#import "BookDetailPresenter.h"
#import "BookStore_ViniciusFragelliSenff-Swift.h"

@interface BookDetailViewController ()

@end

@implementation BookDetailViewController

BookDetailPresenter *presenter;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
    self.title = @"Book Detail";
    presenter = [BookDetailPresenter alloc];
    [presenter setup:_book];
    [self setupBar];
    // Do any additional setup after loading the view from its nib.
}

- (void)setupView {
    _lblTitle.text = _book.volumeInfo.title;
    _lblSubTitle.text = _book.volumeInfo.subtitle;
    _lblAuthor.text = _book.volumeInfo.authorsExtended;
    _lblDescription.text = _book.volumeInfo.descriptionBook;
    [self addShadow: _viewTitle];
    [self addShadow: _viewSubTitle];
    [self addShadow: _viewAuthor];
    [self addShadow: _viewDesc];
    if(_book.accessInfo.pdf.isAvailable && _book.accessInfo.epub.isAvailable){
        [_btnBuy setHidden:NO];
        if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
            _constBtn.constant = 85;
        }else{
            _constBtn.constant = 65;
        }
    }else{
        [_btnBuy setHidden:YES];
        _constBtn.constant = 0;
    }
    [self updateViewConstraints];
}

-(void)setupBar {
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithTitle: presenter.isFavorite ? @"Unfavorite" : @"Favorite" style:UIBarButtonItemStyleBordered target:self action:@selector(onClickFavorite:)];
    self.navigationItem.rightBarButtonItem = barButton;

}

- (void)addShadow: (UIView*) view {
    view.layer.shadowColor = [[UIColor blackColor] CGColor];
    view.layer.shadowOpacity = 0.3;
    NSArray *rows = @[@{@"size" : [NSValue valueWithCGSize:(CGSize){1, 1}]}];
    CGSize size = [rows[0][@"size"] CGSizeValue];
    view.layer.shadowOffset = size;
    view.layer.shadowRadius = 5;
    view.layer.cornerRadius = 4;
}

-(IBAction)onClickFavorite:(id)sender {
    [presenter checkFavorite];
    [self setupBar];
}

- (IBAction)onClickBuy:(id)sender {
    [presenter openURL:_book.saleInfo.buyLink];
}

@end
