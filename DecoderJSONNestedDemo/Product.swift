//
//  Product.swift
//  DecoderJSONNestedDemo
//
//  Created by Macintosh on 27/12/23.
//

import Foundation
struct Post : Decodable{
    var userId : Int
    var id : Int
    var title :  String
    var body : String
}
