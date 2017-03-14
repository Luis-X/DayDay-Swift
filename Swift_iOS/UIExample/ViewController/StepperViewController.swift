//
//  StepperViewController.swift
//  Swift_iOS
//
//  Created by LuisX on 16/3/30.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class StepperViewController: UIViewController {
    var stepperView:UIStepper!
    var label:UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "UIPickerView"
        self.createUIStepperView()
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

    func createUIStepperView(){
//MARK: UIStepper
        stepperView = UIStepper(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        stepperView.backgroundColor = UIColor.white
        stepperView.center = self.view.center
        //最小值
        stepperView.minimumValue = 0
        //最大值
        stepperView.maximumValue = 100
        //默认值
        stepperView.value = 30
        //每次增减值
        stepperView.stepValue = 1
        //是否可以按住不放修改值
        stepperView.isContinuous = true
        //是否循环(到最大值再增加数值从最小值开始)
        stepperView.wraps = true
/*
        //背景图片
        stepperView.setBackgroundImage(UIImage(named: "3.jpg"), forState: .Normal)
        //加号图片
        stepperView.setIncrementImage(UIImage(named: "2.jpg"), forState: .Normal)
        //减号图片
        stepperView.setDecrementImage(UIImage.init(named: "1.jpg"), forState: .Normal)
        //设置加减号之间的分隔图片
        stepperView.setDividerImage(UIImage.init(named: "3.jpg"), forLeftSegmentState: .Normal, rightSegmentState: .Normal)
 */
        stepperView.addTarget(self, action: #selector(self.showStepperChangeValue), for: .valueChanged)
        self.view.addSubview(stepperView)
        
        
        
        
        
        label = UILabel.init(frame: CGRect(x: (self.view.frame.size.width - 200) / 2, y: 50, width: 200, height: 50))
        label.backgroundColor = UIColor.orange
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.text = String("当前值为: \(stepperView.value)")
        self.view.addSubview(label)
    }
    
    //微调器
    func showStepperChangeValue(){
        //print(stepperView.value)
        label.text = String("当前值为: \(stepperView.value)")
    }
}
