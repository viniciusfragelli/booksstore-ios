//
//  AccessInfoVO.swift
//  BookStore_ViniciusFragelliSenff
//
//  Created by MacInBox on 03/08/19.
//  Copyright © 2019 ViniciusFragelli. All rights reserved.
//

import Foundation

class AccessInfo: NSObject,Codable {
    @objc var pdf: AvaliableVO?
    @objc var epub: AvaliableVO?
}
