//
//  ConnectionManager.swift
//  BalinkApp
//
//  Created by Neria Jerafi on 27/01/2021.
//

import Foundation
import Alamofire

// MARK: API Errors
enum APIError:Error {
    case failed
}
// MARK: Status Code
enum StatusCode:Int{
    case ok = 200
    case noContent = 204
}
struct ConnectionManager {
    
    //MARK: Connection Manager methods
    
   static  func getRequest<T:Decodable>(stringURL:String = Constants.apiStringURL,completionHandler:@escaping(Result<T,APIError>)->()) {
        guard let url = URL(string: stringURL) else {return}
        AF.request(url).responseData { (response) in
            if let data = response.data{
                do {
                    let decodeData = try JSONDecoder().decode(T.self, from: data)
                    completionHandler(.success(decodeData))
                } catch  {
                    completionHandler(.failure(.failed))
                }
            }else{
                completionHandler(.failure(.failed))
            }
        }
    }
    
  static  func postRequest(stringURL:String = Constants.apiStringURL, params:Parameters, completionHandler:@escaping(Bool)->())  {
        guard let url = URL(string: stringURL) else {return}
        AF.request(url,method: .post,parameters: params,encoding: JSONEncoding.default).responseJSON { (response) in
            guard let statusCode = response.response?.statusCode else { return completionHandler(false) }
            if statusCode == StatusCode.ok.rawValue {
                completionHandler(true)
            }else{
                completionHandler(false)
            }
        }
    }
    
  static  func deleteRequest(stringURL:String = Constants.apiStringURL, completionHandler:@escaping(Bool)->()) {
        guard let url = URL(string: stringURL) else {return}
        AF.request(url,method: .delete).responseJSON { (response) in
            guard let statusCode = response.response?.statusCode else { return completionHandler(false) }
            if statusCode == StatusCode.noContent.rawValue {
                completionHandler(true)
            }else{
                completionHandler(false)
            }
        }
        
    }
}
