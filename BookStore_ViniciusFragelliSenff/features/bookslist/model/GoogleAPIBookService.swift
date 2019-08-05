//
//  GoogleAPIBookService.swift
//  BookStore_ViniciusFragelliSenff
//
//  Created by MacInBox on 02/08/19.
//  Copyright © 2019 ViniciusFragelli. All rights reserved.
//

import Foundation
import Alamofire

class GoogleAPIBookService {
    
    var presenter: BookListPresenterDelegate?
    
    func getBookList(index: Int = 0) {
        Alamofire.request("https://www.googleapis.com/books/v1/volumes?q=ios&maxResults=20&startIndex=\(index)").responseString { response in
            if let json = response.result.value {
                do {
                    let response = try JSONDecoder().decode(BooksListVO.self, from: json.data(using: String.Encoding.utf8) ?? Data())
                    self.presenter?.setListBooks(response.items ?? [], maxCount: response.totalItems ?? 0)
                } catch {
                    print(error)
                }
            }else{
                
            }
        }
    }
    
}
