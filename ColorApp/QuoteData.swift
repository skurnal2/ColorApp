//
//  QuoteData.swift
//  ColorApp
//
//  Created by Siddharth Kurnal on 3/9/20.
//  Copyright © 2020 Siddharth Kurnal. All rights reserved.
//

import Foundation

struct AllQuoteData : Decodable{
    let results: [QuoteInfo]
}
struct QuoteInfo : Decodable  {
    let quoteText: String
    let quoteAuthor: String
}
