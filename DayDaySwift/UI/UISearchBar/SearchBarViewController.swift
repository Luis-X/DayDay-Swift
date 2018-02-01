//
//  SearchBarViewController.swift
//  DayDaySwift
//
//  Created by LuisX on 16/4/5.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class SearchBarViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    var searchBarTV:UITableView!
    var searchBar:UISearchBar!
    
    var allSearchDataArr:[String]!              //搜索内容
    var allResultArr:[String]!                  //搜索匹配结果
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "UISearchBar"
        
        initailData()
        createSubViews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func initailData() {
        allSearchDataArr = ["label", "button1", "button2", "switch"]
        allResultArr = []
    }

    func createSubViews(){
        //搜索条
        searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80))
        searchBar.delegate = self
        //属性
        //初始搜索内容
        searchBar.text = "搜索"
        //占位
        searchBar.placeholder = "请输入搜索内容"
        //搜索框外面需要显示的文字
        searchBar.prompt = "搜索组件名称"
        //外观
        searchBar.searchBarStyle = .prominent
        //样式
        searchBar.barStyle = .blackTranslucent
        //文本框颜色
        searchBar.barTintColor = UIColor.white
        //是否显示边线
        searchBar.showsScopeBar = true
        //是否显示取消按钮
        searchBar.showsCancelButton = true
        //是否显示图书按钮
        searchBar.showsBookmarkButton = true
        //是否显示搜索结果按钮
        searchBar.showsSearchResultsButton = true
        //是否自动更正
        searchBar.autocorrectionType = .no
        //是否首字母大写
        searchBar.autocapitalizationType = .none
        //searchBar.backgroundColor = UIColor.redColor()
        
        
        
        
        
        //表格
        searchBarTV = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height), style: .plain)
        searchBarTV.delegate = self
        searchBarTV.dataSource = self
        searchBarTV.tableHeaderView = searchBar
        self.view.addSubview(searchBarTV)
        //加载全部内容
        allResultArr = allSearchDataArr
        searchBarTV.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    
//MARK: -UITableViewDataSource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = allResultArr[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allResultArr.count
    }
    
//MARK: -UITableViewDelegate
    
//MARK: -UISearchBarDelegate
    //每次改变搜索内容时都会调用
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //没有搜索内容时显示全部组件
        if (searchBar.text == "") {
            allResultArr = allSearchDataArr
        }else{
            //匹配用户输入内容的前缀
            allResultArr.removeAll()
            
            //取消判断大小写
            for searchData in allSearchDataArr {
                if (searchData.lowercased().hasPrefix(searchText.lowercased())) {
                    allResultArr.append(searchData)
                }
            }
        }
        
        searchBarTV.reloadData()
    }
    
}
