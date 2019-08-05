//
//  BookListViewController.swift
//  BookStore_ViniciusFragelliSenff
//
//  Created by MacInBox on 02/08/19.
//  Copyright © 2019 ViniciusFragelli. All rights reserved.
//

import UIKit

protocol BookListViewControllerDelegate {
    func showIndicator()
    func hideIndicator()
    func setBooks(books:[BookVO], isMore: Bool)
}

@objc class BookListViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    fileprivate var presenter: BookListPresenter?
    fileprivate var list: [BookVO] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Book Store"
        setup()
        setupView()
        setupBar()
    }
    
    private func setup(){
        presenter = BookListPresenter()
        presenter?.view = self
    }
    
    private func setupView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "BookCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BookCollectionViewCell")
    }
    
    private func setupBar(){
        let buttonRight = UIBarButtonItem(title: "My favorite", style: .plain, target: self, action: #selector(onClickMyFavorite))
        navigationItem.rightBarButtonItem = buttonRight
        let buttonLeft = UIBarButtonItem(title: "All books", style: .plain, target: self, action: #selector(onClickAllBooks))
        navigationItem.leftBarButtonItem = buttonLeft
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.getListBooks()
    }
    
    @objc func onClickMyFavorite(){
        list = presenter?.getMyFavorite() ?? []
        collectionView.reloadData()
    }

    @objc func onClickAllBooks(){
        showIndicator()
        presenter?.getListBooks()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let presenter = self.presenter else { return }
        if !presenter.isEndRequest {
            return
        }
        if (scrollView.contentOffset.y >= (scrollView.contentSize.height - scrollView.frame.size.height)) {
            if !presenter.isEndSearch() {
                showIndicator()
                presenter.getListBooks(isMore: true)
            }
        }
    }


}

extension BookListViewController: BookListViewControllerDelegate{
    func showIndicator() {
        indicator.isHidden = false;
    }
    
    func hideIndicator() {
        indicator.isHidden = true;
    }
    
    func setBooks(books: [BookVO], isMore: Bool) {
        hideIndicator()
        list.append(contentsOf: books)
        collectionView.reloadData()
    }
    
    
}

extension BookListViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let book = list[indexPath.row]
        let vc = BookDetailViewController(nibName: "BookDetailViewController", bundle: nil)
        vc.book = book;
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookCollectionViewCell", for: indexPath) as! BookCollectionViewCell
        let book = list[indexPath.row]
        var author = ""
        if let arrayAuthor = book.volumeInfo?.authors {
            for au in arrayAuthor {
                author += au+", "
            }
            if(author.count > 2){
                author = author[0...author.count-3]
            }
        }
        list[indexPath.row].volumeInfo?.authorsExtended = author
        cell.setupView(book.volumeInfo?.title ?? "", book.volumeInfo?.subtitle ?? "", author)
        UIView.animate(withDuration: 0.5, delay: 0.5 * Double(indexPath.row), usingSpringWithDamping: 1, initialSpringVelocity: 0.5, options: indexPath.row % 2 == 0 ? .transitionFlipFromLeft : .transitionFlipFromRight, animations: {
            
            if indexPath.row % 2 == 0 {
                AnimeteUtil.viewSlideInFromLeft(toRight: cell)
            }
            else {
                AnimeteUtil.viewSlideInFromRight(toLeft: cell)
            }
            
        }, completion: { (done) in
        })

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width) / 2
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
