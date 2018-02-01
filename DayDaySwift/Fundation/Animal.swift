//
//  Animal.swift
//  DayDaySwift
//
//  Created by LuisX on 16/3/31.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit
//提供OC调用


@objc class Animal: NSObject{
    @objc override init() {
        print("my List Dog Init!")
    }
    func run() {
        print("my List Dog Run!")
    }
}
