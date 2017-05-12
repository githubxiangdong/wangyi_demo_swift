//
//  HomeViewController.swift
//  wangyi-demo
//
//  Created by new on 2017/5/12.
//  Copyright © 2017年 9-kylins. All rights reserved.
//

import UIKit

//MARK:- 定义全局常量
private let kHomeCellID = "kHomeCellID"

class HomeViewController: UIViewController {
    //MARK:- 懒加载属性
    fileprivate lazy var newsModels : [NewsModel] = [NewsModel]()
    fileprivate lazy var tableView : UITableView = {[unowned self] in // 解决循环引用
        // 1, 创建talbeView
        let tableView = UITableView()
        tableView.frame = self.view.bounds
        tableView.dataSource = self
        tableView.rowHeight = 90
        tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: kHomeCellID)
        return tableView
    }()
    //MARK:- 系统回调函数
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1, 添加tableView
        view.addSubview(tableView)
        
        // 2, 请求数据
        loadData()
    }
}

//MARK:- 网络请求
extension HomeViewController {
    fileprivate func loadData() {
        NetworkTools.request(URLString: "http://c.m.163.com/nc/article/list/T1348649079062/0-20.html", type: .get, success: { (result) in
            // 1, 将any类型转成字典类型
            guard let resultDic = result as? [String : Any] else {return}
            
            // 2, 根据的key取出类容
            guard let dataArr = resultDic["T1348649079062"] as? [[String : Any]] else {return}
            
            // 3, 将字典转模型
            for dic in dataArr {
                self.newsModels.append(NewsModel(dic: dic))
            }
            // 4, 刷新表格
            self.tableView.reloadData()
        }) { (error) in
            print("请求出错\(error)")
        }
    }
}

//MARK:- 实现tableView的数据源代理
extension HomeViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsModels.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 1,获取cell
        let cell = tableView.dequeueReusableCell(withIdentifier: kHomeCellID, for: indexPath) as! HomeTableViewCell
        // 2, 给cell添加数据
        cell.model = newsModels[indexPath.row]
        return cell
    }
}




