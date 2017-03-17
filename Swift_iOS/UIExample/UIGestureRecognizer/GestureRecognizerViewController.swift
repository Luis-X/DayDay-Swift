//
//  GestureRecognizerViewController.swift
//  Swift_iOS
//
//  Created by LuisX on 16/3/30.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class GestureRecognizerViewController: UIViewController {
    var panView:UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "UIGestureRecognizer"
        
        self.createCenterPanView()
        self.createGestureRecognizer()
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

    
    
    func createCenterPanView() {
        self.panView = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        //UILabel 交互默认关闭
        self.panView.isUserInteractionEnabled = true
        self.panView.text = "手势✋"
        self.panView.textAlignment = .center
        self.panView.center = self.view.center
        self.panView.backgroundColor = UIColor.red
        self.view.addSubview(self.panView)
    }
    
    func createGestureRecognizer(){
//MARK: UISwipeGestureRecognizer            滑动(默认向右滑动)
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeEvent))
        //滑动方向
        swipe.direction = .left
        self.view.addGestureRecognizer(swipe)
        
//MARK: UITapGestureRecognizer              点击(默认触摸点1)
        
        //单击
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tapEvent))
        tap.numberOfTouchesRequired = 1                 //点击次数
        tap.numberOfTapsRequired = 1                    //触摸点数
        
        //双击
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(self.tapDoubleEvent))
        doubleTap.numberOfTapsRequired = 1
        doubleTap.numberOfTouchesRequired = 2
        
        //单击事件需要双击事件检测失败后才会执行(如果检测到双击事件,将不会触发单击事件)
        tap.require(toFail: doubleTap)
        self.view.addGestureRecognizer(tap)
        self.view.addGestureRecognizer(doubleTap)
        
//MARK: UIPinchGestureRecognizer                捏合
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(self.pinchEvent(_:)))
        self.view.addGestureRecognizer(pinch)
        
//MARK: UIRotationGestureRecognizer             旋转
        let rotation = UIRotationGestureRecognizer(target: self, action: #selector(self.roationEvent(_:)))
        self.view.addGestureRecognizer(rotation)
        
//MARK: UIPanGestureRecognizer                  拖动
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(self.panEvent(_:)))
        //最大触摸点数
        pan.maximumNumberOfTouches = 1
        self.panView.addGestureRecognizer(pan)
    
    }
    

    func swipeEvent(){
        print("滑动")
    }
    
    func tapEvent(){
        print("单击")
    }
    
    func tapDoubleEvent(){
        print("双击")
    }
    
    func pinchEvent(_ recognizer:UIPinchGestureRecognizer){
        //监听    捏合比例
        print("捏合\(recognizer.scale)")
    }
    
    func roationEvent(_ recognizer:UIRotationGestureRecognizer){
        //监听    旋转角度
        print("旋转\(recognizer.rotation * (180 / CGFloat(M_PI)))")
    }
    
    func panEvent(_ recognizer:UIPanGestureRecognizer){
        //监听    拖动时触摸的位置(中心点)
        let panPoint = recognizer.location(in: self.view)
        print("拖动\(panPoint)")
        self.panView.center = panPoint
    }
}
