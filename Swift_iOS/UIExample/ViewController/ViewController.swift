//
//  ViewController.swift
//  Swift_iOS
//
//  Created by LuisX on 16/3/28.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate{                //签订协议
    //全局变量
    var imageViews:UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //开始动画
        imageViews.startAnimating()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //结束动画
        imageViews.stopAnimating()
    }
    
    
    override func viewDidLoad() {                                                               //override默认重写系统方法
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "基础"
        self.createSubViews()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func createSubViews(){
//MARK: -UILabel
        let lable = UILabel.init(frame: CGRect(x: 10, y: 20, width: UIScreen.main.bounds.size.width - 20, height: 30))
        lable.text = "UILabel"
        lable.backgroundColor = UIColor.red
        lable.textColor = UIColor.black
        lable.textAlignment = NSTextAlignment.center
        //阴影
        lable.shadowColor = UIColor.yellow
        lable.shadowOffset = CGSize(width: 5, height: 5)
        //字体
        lable.font = UIFont(name:"Zapfino", size:20)
        //自动调整
        lable.adjustsFontSizeToFitWidth = true
        //省略方式
        lable.lineBreakMode = NSLineBreakMode.byTruncatingMiddle
        //多行
        lable.numberOfLines = 0
        self.view.addSubview(lable)
        
        
        
        
        
//MARK: -UIButton
        let button = UIButton.init(type: UIButtonType.custom)
        button.frame = CGRect(x: lable.frame.origin.x, y: lable.frame.origin.y + lable.frame.size.height + 10, width: lable.frame.size.width, height: 30)
        button.backgroundColor = UIColor.black
        button.setTitle("普通状态", for: UIControlState())
        button.setTitle("触摸状态", for: UIControlState.highlighted)
        button.setTitle("禁用状态", for: UIControlState.disabled)
        //简写(参数是结构体)
        button.setTitle("普通状态", for: UIControlState())
        self.view .addSubview(button)
        button.addTarget(self, action:#selector(self.tappedEvent(_:)) , for: .touchUpInside)
        
        
        
        
        
//MARK: -UITextField
        let textFiled = UITextField.init(frame: CGRect(x: button.frame.origin.x, y: button.frame.origin.y + button.frame.size.height + 10, width: lable.frame.size.width, height: 30))
        textFiled.backgroundColor = UIColor.green
        //文本占位
        textFiled.placeholder = "UITextFiled"
        //水平对齐方式
        textFiled.textAlignment = .center
        //垂直对齐方式
        textFiled.contentVerticalAlignment = .bottom
        //边框样式
        textFiled.borderStyle = .roundedRect
        //自动调整文字
        textFiled.adjustsFontSizeToFitWidth = true
        //最小缩小字号
        textFiled.minimumFontSize = 10
        //键盘return键
        textFiled.returnKeyType = .done
        //清除按钮
        textFiled.clearButtonMode = .unlessEditing
        //背景图片
        textFiled.background = UIImage(named: "1.jpg")
        self.view .addSubview(textFiled)
        //代理
        textFiled.delegate = self;
        
        
        
        
        
//MARK: -UITextView
        let textView = UITextView.init(frame: CGRect(x: textFiled.frame.origin.x, y: textFiled.frame.origin.y + textFiled.frame.size.height + 10, width: textFiled.frame.size.width, height: 100))
        textView.backgroundColor = UIColor.gray
        textView.layer.borderColor = UIColor.red.cgColor
        textView.layer.borderWidth = 0.5
        //是否可以编辑
        textView.isEditable = true
        textView.text = "第一行\n第二行\n第三行 15504222202"
        //电话和文字自动加链接
        textView.dataDetectorTypes = .phoneNumber
        //允许编辑操作
        textView.allowsEditingTextAttributes = true
        //获得当前可选择范围
        //textView.selectedRange
        //光标位置
        //textView.scrollRangeToVisible(NSMakeRange(0, textView.selectedRange.length))
        //文字不能选择,防止复制
        textView.isSelectable = true
        self.view .addSubview(textView)
        textView.delegate = self
        
        
        
        
        
//MARK: -UISwitch(大小固定)
        let switchBtn = UISwitch.init(frame: CGRect(x: textView.frame.origin.x, y: textView.frame.origin.y + textView.frame.size.height + 10, width: textView.frame.size.width, height: textView.frame.size.height))
        //开关
        switchBtn.isOn = true
        //关闭图片
        switchBtn.offImage = UIImage(named: "1.jpg")
        //开启图片
        switchBtn.onImage = UIImage(named: "2.jpg")
        //开启颜色
        switchBtn.onTintColor = UIColor.black
        //边框颜色
        switchBtn.tintColor = UIColor.red
        //添加事件
        switchBtn.addTarget(self, action:#selector(self.switchBtnEvent(_:)), for: .valueChanged)
        self.view .addSubview(switchBtn)
        
        
        
        
        
//MARK: -UISegmentedControl   
        let segmentItems = ["1", "2", "选择3"]
        let segmentControl = UISegmentedControl.init(items: segmentItems)
        segmentControl.frame =  CGRect(x: switchBtn.frame.origin.x, y: switchBtn.frame.origin.y + switchBtn.frame.size.height + 10, width: textView.frame.size.width, height: switchBtn.frame.size.height)
        //默认选择
        segmentControl.selectedSegmentIndex = 2
        //填充颜色
        segmentControl.tintColor = UIColor.red
        //设置标题
        segmentControl.setTitle("one", forSegmentAt: 0)
        //设置图片
        segmentControl.setImage(UIImage(named: "1.jpg"), forSegmentAt: 1)
        //设置偏移距离
        segmentControl.setContentOffset(CGSize(width: 2, height: 5), forSegmentAt: 2)
        //插入选项
        segmentControl.insertSegment(withTitle: "插入选项", at: 1, animated: false)
        //删除选项
        segmentControl.removeSegment(at: 2, animated: false)
        self.view.addSubview(segmentControl)
        //监听valueChanged事件
        segmentControl.addTarget(self, action: #selector(self.segmentControlEvent(_:)), for: .valueChanged)
        
        
        
        
        
//MARK: -UIImageView
        imageViews = UIImageView.init(frame: CGRect(x: segmentControl.frame.origin.x, y: segmentControl.frame.origin.y + segmentControl.frame.size.height + 10, width: segmentControl.frame.size.width, height: 100))
        imageViews.backgroundColor = UIColor.orange
        //设置图片
        imageViews.image = UIImage.init(named: "1.jpg")
        imageViews.image = UIImage(named: "1.jpg")
        //显示方式
        imageViews.contentMode = .scaleAspectFill
        //裁剪
        imageViews.clipsToBounds = true
        //动画
        imageViews.animationImages = [UIImage(named:"1.jpg")!, UIImage(named:"2.jpg")!]
        //间隔时间
        imageViews.animationDuration = 2.5
        self.view.addSubview(imageViews)
        
        

        
        
//MARK: -UIProgressView
        let progressView = UIProgressView.init(frame: CGRect(x: imageViews.frame.origin.x, y: imageViews.frame.origin.y + imageViews.frame.size.height + 10, width: imageViews.frame.size.width, height: 30))
        progressView.backgroundColor = UIColor.brown
        //样式
        progressView.progressViewStyle = .default
        //进度(0-1)
        progressView.progress = 0.5
        progressView.setProgress(0.8, animated: true)
        //进度颜色
        progressView.progressTintColor = UIColor.red
        //剩余进度颜色
        progressView.trackTintColor = UIColor.green
        self.view .addSubview(progressView)

        
        
        
        
//MARK: -UISlider
        let slider = UISlider.init(frame: CGRect(x: progressView.frame.origin.x, y: progressView.frame.origin.y + progressView.frame.size.height + 10, width: progressView.frame.size.width, height: 30))
        slider.backgroundColor = UIColor.brown
        //最小值
        slider.minimumValue = 0
        //最大值
        slider.maximumValue = 100
        //默认值
        slider.value = 50
        slider.setValue(80, animated: true)
        //最小值(左面)
        slider.minimumTrackTintColor = UIColor.white
        slider.minimumValueImage = UIImage(named: "6.jpg")
        //最大值(右面)
        slider.maximumTrackTintColor = UIColor.black
        slider.maximumValueImage = UIImage(named: "7.jpg")
        //滑块
        slider.thumbTintColor = UIColor.yellow
        slider.setThumbImage(UIImage(named: "8.jpg"), for: UIControlState())
        self.view .addSubview(slider)
}
    
    
    
    
    
    
    
    
    //按钮
    func tappedEvent(_ button:UIButton) {
        print("按钮 没有返回值")
    }
    
    //开关
    func switchBtnEvent(_ switchButton:UISwitch) {
        if (switchButton.isSelected) {
            switchButton.isSelected = false
            print("开")
        }else{
            switchButton.isSelected = true
            print("关")
        }
    }
    
    //选项卡
    func segmentControlEvent(_ segment:UISegmentedControl) {
        print("选中", segment.selectedSegmentIndex)
        print("内容", segment.titleForSegment(at: segment.selectedSegmentIndex))
    }
    
    
    
    
    
    
//MARK: -UITextFieldDelegate
    //Return键点击方法
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //回收键盘
        textField.resignFirstResponder()
        print("点击了Return键")
        return true
    }
    
//MARK: -UITextViewDelegate
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("TF开始编辑")
        return true
    }

}
