//
//  VolumeInfoVO.swift
//  BookStore_ViniciusFragelliSenff
//
//  Created by MacInBox on 02/08/19.
//  Copyright © 2019 ViniciusFragelli. All rights reserved.
//

import Foundation

class VolumeInfoVO: NSObject, Codable {
    @objc var title: String?
    @objc var subtitle: String?
    @objc var authors: [String]?
    @objc var authorsExtended: String?
    @objc var descriptionBook: String?
    
    enum CodingKeys: String, CodingKey {
        case descriptionBook = "description"
        case title
        case subtitle
        case authors
    }
}
