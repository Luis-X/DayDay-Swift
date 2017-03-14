//
//  DatePickerViewController.swift
//  Swift_iOS
//
//  Created by LuisX on 16/3/30.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {
    var datePickerView:UIDatePicker!
    var downDatePicker:UIDatePicker!
    var startBtn:UIButton!
    var shengyuTime:Int = 10
    var timer:Timer!
    var alertVC:UIAlertController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "UIDatePicker"
        self.createDatePicker()
        self.createCountDownTimeDatePicker()
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
    
    
    
    
    func createDatePicker(){
//MARK: UIDatePicker
        
        datePickerView = UIDatePicker(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 200))
        datePickerView.backgroundColor = UIColor(white: 1, alpha: 1)
        //设置模式
        /*
         Date: 只显示日期,不显示时间
         Time: 只显示时间,不显示日期
         DateAndTime: 同时显示日期和时间
         CountDownTimer: 显示为倒计时状态
        */
        datePickerView.datePickerMode = .dateAndTime
        //本地化显示
        datePickerView.locale = Locale(identifier: "zh_CN")
        //最小时间单位间隔(Date模式下无效)
        datePickerView.minuteInterval = 5
        //倒计时(倒计时模式下,必须为60整数倍)
        datePickerView.countDownDuration = 60
        //时间范围
        //datePickerView.constraints = [NSLayoutConstraint.]
        self.view.addSubview(datePickerView)
        
        //属性
        let loacleIDStr = datePickerView.locale?.identifier
        let calendarIDStr = datePickerView.calendar.identifier
        let dateStr = datePickerView.date.description(with: datePickerView?.locale)
        print(" 本地化标识:\(loacleIDStr)\n 日历标识:\(calendarIDStr)\n 时间:\(dateStr)")

        
        
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: datePickerView.frame.origin.x, y: datePickerView.frame.origin.y + datePickerView.frame.size.height + 10, width: datePickerView.frame.size.width, height: 50)
        button.setTitle("显示时间", for: UIControlState())
        button.backgroundColor = UIColor.orange
        self.view.addSubview(button)
        button.addTarget(self, action: #selector(self.showClicked(_:)), for: .touchUpInside)
        
    }

    func showClicked(_ sender:UIButton){
        let date = datePickerView.date
        //创建时间格式
        let dformatter = DateFormatter()
        //设置格式
        dformatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
        //使用日期格式
        let dateStr = dformatter.string(from: date)

        
        let alertVC = UIAlertController(title: "当前时间", message: "\(dateStr)", preferredStyle: .alert)
        let sureAction = UIAlertAction(title: "确定", style: .default) { (UIAlertAction) in
            
        }
        alertVC.addAction(sureAction)
        self.present(alertVC, animated: true) { 
            
        }
    }
    
    
    
    
    
//MARK: 倒计时         (必须为60的整数倍)
    func createCountDownTimeDatePicker(){
        
        downDatePicker = UIDatePicker(frame: CGRect(x: 0, y: self.view.frame.size.height - 200 - 64, width: self.view.frame.size.width, height: 150))
        //倒计时模式
        downDatePicker.datePickerMode = .countDownTimer
        //必须是60的整数倍, 如果设置100,值自动变为60
        downDatePicker.countDownDuration = TimeInterval(shengyuTime)
        self.view.addSubview(downDatePicker)
        downDatePicker.addTarget(self, action: #selector(self.downDatePickerChange), for: .valueChanged)
        
        
        
        
        
        startBtn = UIButton(type: .custom)
        startBtn.frame = CGRect(x: 0, y: downDatePicker.frame.size.height + downDatePicker.frame.origin.y, width: downDatePicker.frame.size.width, height: 50)
        startBtn.backgroundColor = UIColor.brown
        startBtn.setTitleColor(UIColor.green, for: .disabled)
        startBtn.setTitle("开始", for: UIControlState())
        startBtn.setTitle("倒计时中", for: .disabled)
        startBtn.clipsToBounds = true
        startBtn.layer.cornerRadius = 5
        self.view.addSubview(startBtn)
        startBtn.addTarget(self, action: #selector(self.startClicked(_:)), for: .touchUpInside)
        }
    
    
    
    
    func downDatePickerChange(){
        print("倒计时:" + String(datePickerView.countDownDuration))
    }
    
    //倒计时开始
    func startClicked(_ sender:UIButton){
        startBtn.isEnabled = false
        
        //获取倒计时剩余时间
        shengyuTime = Int(self.downDatePicker.countDownDuration)
        //禁用UIDatePicker控件按钮
        downDatePicker.isEnabled = false
        
//提示框
        let message = String("倒计时开始, 还有\(shengyuTime)秒")
        //let message1 = NSString(format: "倒计时开始,还有%d秒", shengyuTime)
        alertVC = UIAlertController(title: "倒计时开始", message: message, preferredStyle: .alert)
        let sureAction = UIAlertAction(title: "确定", style: .default) { (UIAlertAction) in
            
        }
        alertVC.addAction(sureAction)
        self.present(alertVC, animated: true) { 
            
        }

//添加计时器
       timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.tickDown), userInfo: nil, repeats: true)
    }
    
//记时方法
    func tickDown(){
        //剩余秒数-1
        shengyuTime -= 1
        //修改剩余秒数
        downDatePicker.countDownDuration = TimeInterval(shengyuTime)
        alertVC.message = String("倒计时开始, 还有\(shengyuTime)秒")
        print("剩余时间" + String(shengyuTime))
        
        //剩余时间小于等于0
        if shengyuTime <= 0 {
            //取消定时器
            timer.invalidate()
            //启用UIDatePicker和按钮
            downDatePicker.isEnabled = true
            downDatePicker.isEnabled = true
            
            
            //修改显示框
            alertVC.title = "时间到"
            alertVC.message = "时间到!"
            alertVC.dismiss(animated: true, completion: { 
                
            })
        }
    }
}
