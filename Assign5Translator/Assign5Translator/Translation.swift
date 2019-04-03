////
////  Translation.swift
////  Assign5Translator
////
////  Created by Pigman, Luke on 4/1/19.
////  Copyright © 2019 Pigman, Luke. All rights reserved.
////
//
////
////  ToDo.swift
////  Assign5Translator
////
////  Created by Pigman, Luke on 3/25/19.
////  Copyright © 2019 Pigman, Luke. All rights reserved.
////
//
//import Foundation
//
//struct Translation: Codable{
//    var baseWord: String
//    var foreignLanguage: String
//    var foreignWord: String
//    var id: Int
//
//    static func endpointForLanguage( foreignLanguage: String) -> String {
//        return "http://gfish.ad.ilstu.edu:8080/ForeignWordsRESTApp/webresources/entities.foreignwords/Hello/\(foreignLanguage)"
//    }
//
//    static func endpointForTranslations () -> String {
//        return "http://gfish.ad.ilstu.edu:8080/ForeignWordsRESTApp/webresources/entities.foreignwords/"
//    }
//
//    enum BackendError : Error {
//        case urlError(reason: String)
//        case objectSerialization(reason: String)
//    }
//
//    static func translate() {
//
//    }
//
//
//    static func translateByLanguage ( language: String, completionHandler: @escaping (Translation?, Error?) -> Void) {
//        let endpoint = Translation.endpointForLanguage(foreignLanguage: language)
//        guard let url = URL(string: endpoint) else {
//            print("Error: cannot create URL")
//            let error = BackendError.urlError(reason: "Could not create URL")
//            completionHandler(nil, error)
//            return
//        }
//        let urlRequest = URLRequest(url: url)
//
//        let session = URLSession.shared
//
//        let task = session.dataTask(with: urlRequest, completionHandler: {
//            (data, response, error) in
//            guard let responseData = data else {
//                print("Error: did not receive data")
//                completionHandler(nil, error)
//                return
//            }
//            guard error == nil else {
//                completionHandler(nil, error!)
//                return
//            }
//
//            let decoder = JSONDecoder()
//            do {
//                let translate = try decoder.decode(Translation.self, from: responseData)
//                completionHandler(translate, nil)
//            } catch {
//                print("error trying to convert data to JSON")
//                print(error)
//                completionHandler(nil, error)
//            }
//        })
//        task.resume()
//    }
//
////    static func allTranslations(completionHandler: @escaping ([Translation]?, Error?) -> Void) {  // note the array of Todos
////        let endpoint = Translation.endpointForTranslations()
////        guard let url = URL(string: endpoint) else {
////            print("Error: cannot create URL")
////            let error = BackendError.urlError(reason: "Could not construct URL")
////            completionHandler(nil, error)
////            return
////        }
////        let urlRequest = URLRequest(url: url)
////
////        let session = URLSession.shared
////
////        let task = session.dataTask(with: urlRequest) {
////            (data, response, error) in
////            guard let responseData = data else {
////                print("Error: did not receive data")
////                completionHandler(nil, error)
////                return
////            }
////            guard error == nil else {
////                completionHandler(nil, error)
////                return
////            }
////
////            let decoder = JSONDecoder()
////            do {
////                let translations = try decoder.decode([Translation].self, from: responseData) // note the array of Todos
////                completionHandler(translations, nil)
////            } catch {
////                print("error trying to convert data to JSON")
////                print(error)
////                completionHandler(nil, error)
////            }
////        }
////        task.resume()
////    }
//}
