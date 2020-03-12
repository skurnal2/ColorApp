//
//  QuoteManager.swift
//  ColorApp
//
//  Created by Siddharth Kurnal on 3/9/20.
//  Copyright © 2020 Siddharth Kurnal. All rights reserved.
//

import UIKit

import Foundation
class QuoteManager {
    var quoteUrlString = "https://andruxnet-random-famous-quotes.p.rapidapi.com"
    let apiKey = "a3e5a49dcemsha4368f1bcc41dd0p16f41ejsn7893d7170b28"
    
    
    var quoteList  = [QuoteInfo]()
    
    init() {
        //Appending Key to URL
        quoteUrlString = quoteUrlString.appending("?x-rapidapi-key=\(apiKey)")
        // Step 1: Create a URL instance
        if let quotesURL = URL(string: quoteUrlString) {
            // Step 2: Create a URLSession
            let session = URLSession(configuration: .default)
            // Step 3: Create a dataTask with the URLSession instance
            let task = session.dataTask(with: quotesURL) {
                (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let responseData = data {
                    //                    let responseDataString = String(data: responseData, encoding: .utf8)
                    //                    print (responseDataString ?? "no response data")
                    let decoder = JSONDecoder()
                    do {
                        let decodedData = try decoder.decode(QuoteInfo.self, from: responseData)
                        self.quoteList = [decodedData]
                    } catch {
                        print(error)
                    }
                }
            }
            
            // Step 4: Start the dataTask
            task.resume()
        }
        
    }
    
}
