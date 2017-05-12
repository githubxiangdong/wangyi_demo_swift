//
//  NewsModel.swift
//  wangyi-demo
//
//  Created by new on 2017/5/12.
//  Copyright © 2017年 9-kylins. All rights reserved.
//

import UIKit

/*
 使用kvc的条件，
 1> 继承自nsobject
 2> 必须先调用super.init()
 3> 调用setValuesForKeys
 4> 如果字典中某一个key没有对应的属性，则要重写 setValue forUndefinedKey
 */

class NewsModel: NSObject {
    //MARK:- 定义属性
    var replyCount : Int = 0
    var title : String = ""
    var source : String = ""
    var imgsrc : String = ""
    
    //MARK:- 定义字典转模型的构造函数
    init(dic : [String : Any]){
        super.init()
        setValuesForKeys(dic)
    }
    // 重写setvalue 
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}
