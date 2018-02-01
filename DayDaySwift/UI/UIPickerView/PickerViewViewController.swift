//
//  PickerViewViewController.swift
//  DayDaySwift
//
//  Created by LuisX on 16/3/29.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class PickerViewViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    var myPickerView:UIPickerView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "UIPickerView"
        self.createPickerView()
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
    
    func createPickerView(){
        myPickerView = UIPickerView.init(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 200))
        myPickerView.backgroundColor = UIColor.init(white: 0, alpha: 0.2)
        myPickerView.center = self.view.center
        //先指定代理人
        myPickerView.dataSource = self
        myPickerView.delegate = self
        //设置默认值
        myPickerView.selectRow(1, inComponent: 0, animated: true)
        myPickerView.selectRow(2, inComponent: 1, animated: true)
        myPickerView.selectRow(3, inComponent: 2, animated: true)
        self.view.addSubview(myPickerView)
        
        let pickerSelectedBtn = UIButton.init(type: .custom)
        pickerSelectedBtn.frame = CGRect(x: myPickerView.frame.origin.x, y: myPickerView.frame.origin.y + myPickerView.frame.size.height, width: myPickerView.frame.size.width, height: 50)
        pickerSelectedBtn.backgroundColor = UIColor.red
        pickerSelectedBtn.setTitle("确定", for: UIControlState())
        self.view.addSubview(pickerSelectedBtn)
        pickerSelectedBtn.addTarget(self, action: #selector(self.getPickerViewValue), for: .touchUpInside)
    }
    
    
    @objc func getPickerViewValue(){
        //获得指定列被选中的索引
        let messageStr = String(myPickerView.selectedRow(inComponent: 0)) + "-" + String(myPickerView.selectedRow(inComponent: 1)) + "-" + String(myPickerView.selectedRow(inComponent: 2))
        let alertVC = UIAlertController.init(title: "选中的索引为", message: messageStr, preferredStyle: .alert)
        let sureAction = UIAlertAction.init(title: "确定", style: .default) { (UIAlertAction) in
            
        }
        alertVC.addAction(sureAction)
        self.present(alertVC, animated: true) { 
            
        }
        
    }
    
    
//MARK: -UIPickerViewDataSource
    
    //列数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    //行数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 9
    }
/*
    //自定义内容
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        let image = UIImage(named: "")
        let imageView = UIImageView.init(image: image)
        return imageView
    }
 */
    
//MARK: -UIPickerViewDelegate
    
    //标题
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //行数row, 列数componet
        return String(row)+"-"+String(component)
    }
    
    //选中(滑动停止后触发)
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("列:\(component) 行:\(row)")

    }
    
    //行高
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 44
    }
    
    //列宽
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        if 0 == component {
            return 80
        }else{
            return 60
        }
    }
    
    
}
