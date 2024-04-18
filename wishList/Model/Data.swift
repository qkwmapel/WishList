//
//  Data.swift
//  wishList
//
//  Created by 송정훈 on 4/12/24.
//

import Foundation

struct Product: Decodable{
    let id : Int32
    let title : String
    let description : String
    let price : Double
//    let discountPercentage : Double
//    let rating : Double
//    let stock : Int
//    let brand : String
//    let category : String
    let thumbnail : String
//    let images : [String]
}

