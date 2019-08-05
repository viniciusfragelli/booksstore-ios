//
//  BookListPresenter.swift
//  BookStore_ViniciusFragelliSenff
//
//  Created by MacInBox on 02/08/19.
//  Copyright © 2019 ViniciusFragelli. All rights reserved.
//

import Foundation

protocol BookListPresenterDelegate {
    func setListBooks(_ list: [BookVO], maxCount: Int)
}

class BookListPresenter {
    
    let service: GoogleAPIBookService
    let storage: StorageInteractor
    var view: BookListViewControllerDelegate?
    
    private var countList = 20;
    var isEndRequest = false
    var isMore  = false
    var maxCount = 0
    
    required init() {
        service = GoogleAPIBookService()
        storage = StorageInteractor()
        service.presenter = self
    }
    
    func getListBooks(isMore: Bool = false) {
        if maxCount == 0 || countList < maxCount {
            isEndRequest = false
            self.isMore = isMore
            countList = isMore ? countList + 20 : 20
            isMore ? service.getBookList(index: countList) : service.getBookList()
        } else {
            view?.setBooks(books: [], isMore: true)
        }
    }

    func isEndSearch() -> Bool {
        return countList >= maxCount
    }
    
    func getMyFavorite() -> [BookVO] {
        return storage.getMyFavorite()
    }
    
}

extension BookListPresenter: BookListPresenterDelegate {
    func setListBooks(_ list: [BookVO], maxCount: Int) {
        self.maxCount = maxCount
        isEndRequest = true
        view?.setBooks(books: list, isMore: isMore)
    }
}
