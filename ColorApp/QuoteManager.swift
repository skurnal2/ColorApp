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
    var quoteUrlString = "https://quote-garden.herokuapp.com/quotes/search/life"
    
    
    var quoteList = [String]()
    
   func fetchQuotes(completionHandler:@escaping () -> Void) {
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
                        let decodedData = try decoder.decode(AllQuoteData.self, from: responseData)
                        decodedData.results.forEach {
                            singleQuote in
                            print(singleQuote.quoteText)
                            print(singleQuote.quoteAuthor)
                            self.quoteList.append(singleQuote.quoteText)
                            
                            OperationQueue.main.addOperation {
                                completionHandler()
                            }
                        }
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
