//
//  DownloadDataInteractor.swift
//  TransactionApp
//
//  Created by jose.sanchezporro on 28/10/2018.
//  Copyright © 2018 jose.sanchezporro. All rights reserved.
//

import Foundation

typealias errorClosure = ((Error) -> Void)?

protocol DownloadDataInteractor {
    func execute(onSuccess: @escaping ([Transaction]) -> Void, onError: errorClosure)
}

class DownloadDataInteractorImpl: DownloadDataInteractor {
    func execute(onSuccess: @escaping ([Transaction]) -> Void, onError: errorClosure) {
        let session = URLSession.shared
        let urlString:String = Endpoints.dataEndpoint
        if let url = URL(string: urlString){
            let task = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
                OperationQueue.main.addOperation {
                    if error == nil{
                        do {
                            let decoder = JSONDecoder()
                            let result = try decoder.decode([Transaction].self, from: data!)
                            onSuccess(result)
                        } catch {
                            print("caught: \(error)")
                        }
                        
                    }else{
                        if let myError = onError{
                            myError(error!)
                        }
                    }
                }
                
            }
            task.resume()
        }
    }
}
