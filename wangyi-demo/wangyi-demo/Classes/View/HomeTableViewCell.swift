//
//  HomeTableViewCell.swift
//  wangyi-demo
//
//  Created by new on 2017/5/12.
//  Copyright © 2017年 9-kylins. All rights reserved.
//

import UIKit
import Kingfisher

class HomeTableViewCell: UITableViewCell {
    //MARK:- 控件属性
    @IBOutlet var iconImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var sourceLabel: UILabel!
    @IBOutlet var followLabel: UILabel!

    //MARK:- 模型
    var model : NewsModel? {
        didSet {
            titleLabel.text = model?.title
            sourceLabel.text = model?.source
            followLabel.text = "\(model?.replyCount ?? 0)跟帖"
            
            let iconUrl = URL(string: model?.imgsrc ?? "")
            iconImageView.kf.setImage(with: iconUrl, placeholder: UIImage(named: ""))
        }
    }
}
