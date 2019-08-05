//
//  BooksList.swift
//  BookStore_ViniciusFragelliSenff
//
//  Created by MacInBox on 02/08/19.
//  Copyright © 2019 ViniciusFragelli. All rights reserved.
//

import Foundation

class BooksListVO: NSObject, Codable {
    var kind: String?
    var totalItems: Int?
    var items: [BookVO]?
}
