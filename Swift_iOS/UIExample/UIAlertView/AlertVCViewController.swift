//
//  LearnViewViewController.swift
//  Swift_iOS
//
//  Created by LuisX on 16/3/29.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class AlertVCViewController: UIViewController, UIAlertViewDelegate, UIActionSheetDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "UIAlertViewController"
        self.creteSubViews()
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
    
//初始化视图
    func creteSubViews(){
        
        //UIAlertView
        let alertBtn = UIButton.init(type: .custom)
        alertBtn.frame = CGRect(x: 10, y: 20, width: 170, height: 30)
        alertBtn.backgroundColor = UIColor.orange
        alertBtn.setTitle("UIAlertView", for: UIControlState())
        alertBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        self.view.addSubview(alertBtn)
        alertBtn .addTarget(self, action:#selector(self.showMyAlertView), for: .touchUpInside)
        
        //UIAlertView_iOS9
        let alertBtn2 = UIButton.init(type: .custom)
        alertBtn2.frame = CGRect(x: self.view.frame.size.width - 10 - alertBtn.frame.size.width, y: alertBtn.frame.origin.y, width: alertBtn.frame.size.width, height: 30)
        alertBtn2.backgroundColor = UIColor.orange
        alertBtn2.setTitle("UIAlertController iOS9", for: UIControlState())
        alertBtn2.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        self.view.addSubview(alertBtn2)
        alertBtn2 .addTarget(self, action:#selector(self.showMyAlertViewIOS9), for: .touchUpInside)
        
        //UIActionSheet
        let sheetBtn = UIButton.init(type: .custom)
        sheetBtn.frame = CGRect(x: alertBtn.frame.origin.x, y: alertBtn.frame.origin.y + alertBtn.frame.size.height + 20, width: alertBtn.frame.size.width, height: alertBtn.frame.size.height)
        sheetBtn.backgroundColor = UIColor.brown
        sheetBtn.setTitle("UIActionSheet", for: UIControlState())
        sheetBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        self.view.addSubview(sheetBtn)
        sheetBtn.addTarget(self, action: #selector(self.showActionSheetView), for: .touchUpInside)
        
        //UIActionSheet_iOS9
        let sheetBtn2 = UIButton.init(type: .custom)
        sheetBtn2.frame = CGRect(x: alertBtn2.frame.origin.x, y: alertBtn2.frame.origin.y + alertBtn2.frame.size.height + 20, width: alertBtn2.frame.size.width, height: alertBtn2.frame.size.height)
        sheetBtn2.backgroundColor = UIColor.brown
        sheetBtn2.setTitle("UIAlertController iOS9", for: UIControlState())
        sheetBtn2.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        self.view.addSubview(sheetBtn2)
        sheetBtn2.addTarget(self, action: #selector(self.showActionSheetViewIOS9), for: .touchUpInside)

        
    }
    
    
//MARK: UIAlertView
    func showMyAlertView(){
        
        let alertView = UIAlertView.init(title: "UIAlertView", message: "信息", delegate: self, cancelButtonTitle: "取消")
        alertView.show()
        
    }
//MARK: -UIAlertViewDelegate
    func alertView(_ alertView: UIAlertView, clickedButtonAt buttonIndex: Int) {
        if buttonIndex == alertView.cancelButtonIndex {
            print("UIAlertView取消")
        }
    }
    
//MARK: UIAlertView_iOS9
    //iOS9推荐使用UIAlertController
    func showMyAlertViewIOS9() {
        let alertViewController = UIAlertController.init(title: "UIAlertController", message: "信息", preferredStyle: .alert)
        let alertAction = UIAlertAction.init(title: "确定", style: .destructive) { (UIAlertAction) in
            print("UIAlertController确定")
        }
        let cancleAction = UIAlertAction.init(title: "取消", style: .cancel) { (UIAlertAction) in
            print("UIAlertController取消")
        }
        alertViewController.addAction(alertAction)
        alertViewController.addAction(cancleAction)
        self.present(alertViewController, animated: true) {
            print("UIAlertController显示")
        }
    }
    
    
//MARK: UIActionSheet
    func showActionSheetView() {
        let actionSheetView = UIActionSheet.init(title: "UIActionSheet", delegate: self, cancelButtonTitle: "选项1", destructiveButtonTitle: "选项2")
        //普通
        actionSheetView.show(in: self.view)
        /*
        //工具条
        actionSheetView.showFromToolbar((self.navigationController?.toolbar)!)
        //标签栏
        actionSheetView.showFromToolbar(self.tabBarController?.tabBar)
        */
    }
//MARK: -UIActionSheetDelegate
    func actionSheet(_ actionSheet: UIActionSheet, clickedButtonAt buttonIndex: Int) {
        if buttonIndex == actionSheet.cancelButtonIndex {
            print("UIActionSheet点击选项1")
        }
    }
    
//MARK: UIActionSheet_iOS9
    func showActionSheetViewIOS9() {
       let actionSheetControl = UIAlertController.init(title: "UIAlertController", message: "信息", preferredStyle: .actionSheet)
        let oneSheet = UIAlertAction.init(title: "选项1", style: .default) { (UIAlertAction) in
            print("选项1")
        }
        let oneSheet2 = UIAlertAction.init(title: "选项2", style: .default) { (UIAlertAction) in
            print("选项2")
        }
        actionSheetControl.addAction(oneSheet)
        actionSheetControl.addAction(oneSheet2)
        self.present(actionSheetControl, animated: true) { 
            
        }
    }
}
