//
//  NetworkTools.swift
//  wangyi-demo
//
//  Created by new on 2017/5/12.
//  Copyright © 2017年 9-kylins. All rights reserved.
//

import UIKit
import Alamofire

enum MethodType {
    case get
    case post
}
class NetworkTools {

    //// parameters : [String : Any]? = nil 参数是字典，默认是空
    class func request(URLString : String, type : MethodType, parameters : [String : Any]? = nil, success : @escaping (_ result : Any) -> (), failure : @escaping (_ result : Error) -> ()) {
        
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        Alamofire.request(URLString, method: method, parameters: parameters).responseJSON { (response) in
            
            // 1, 校验是否有结果
            guard let result = response.result.value else {
                
                failure(response.result.error!)
                return
            }
            
            // 2, 将结果回调出去
            success(result)
        }
    }
}
