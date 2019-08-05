//
//  BookVO.swift
//  BookStore_ViniciusFragelliSenff
//
//  Created by MacInBox on 02/08/19.
//  Copyright © 2019 ViniciusFragelli. All rights reserved.
//

import Foundation

@objc class BookVO: NSObject,Codable {
    @objc var id: String?
    @objc var saleInfo: SaleInfoVO?
    @objc var volumeInfo: VolumeInfoVO?
    @objc var accessInfo: AccessInfo?
    
}
