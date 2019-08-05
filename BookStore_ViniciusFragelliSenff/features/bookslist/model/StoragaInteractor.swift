//
//  StoragaInteractor.swift
//  BookStore_ViniciusFragelliSenff
//
//  Created by MacInBox on 05/08/19.
//  Copyright © 2019 ViniciusFragelli. All rights reserved.
//

import Foundation

class StorageInteractor {
    func getMyFavorite() -> [BookVO] {
        return PrefsUtil.getMyFavorites()
    }
}
