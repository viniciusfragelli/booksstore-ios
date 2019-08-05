//
//  PrefUtils.swift
//  BookStore_ViniciusFragelliSenff
//
//  Created by MacInBox on 04/08/19.
//  Copyright © 2019 ViniciusFragelli. All rights reserved.
//

import Foundation

class PrefsUtil : NSObject {
    @objc static func setMyFavorites(fav: [BookVO]){
        let jsonE = JSONEncoder()
        let json = try? jsonE.encode(fav)
        UserDefaults.standard.set(json, forKey: "favorite")
        UserDefaults.standard.synchronize()
    }
    
    @objc static func getMyFavorites() -> [BookVO] {
        let data = UserDefaults.standard.object(forKey: "favorite") as? Data
        if let arq = data {
            let response = try? JSONDecoder().decode([BookVO].self, from: arq)
            if let array = response {
                return array
            }
        }
        setMyFavorites(fav: [])
        return []
    }
    
    @objc static func verifyIsFavorite(id: String) -> Bool {
        let list = getMyFavorites()
        for book in list {
            if book.id == id {
                return true;
            }
        }
        return false;
    }
    
    @objc static func addBook(book: BookVO){
        var array = getMyFavorites()
        array.append(book)
        setMyFavorites(fav: array)
    }

    @objc static func removeBook(book: BookVO){
        var array = getMyFavorites()
        for i in 0...array.count-1 {
            if book.id == array[i].id {
                array.remove(at: i)
                break;
            }
        }
        setMyFavorites(fav: array)
    }

}
