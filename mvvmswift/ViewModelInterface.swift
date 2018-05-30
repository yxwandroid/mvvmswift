//
//  ViewModel.swift
//  mvvmswift
//
//  Created by 杨学武 on 2018/5/29.
//  Copyright © 2018年 leedian. All rights reserved.
//

import Foundation
import UIKit

//定义委托
@objc protocol ViewModelDelegate {
    func reloadViews()
    func alertInfo()
    func moveToHomeScreen()
}

//
protocol ViewModelInterface {
    //viewmodel会持有以后委托
    var delegate: ViewModelDelegate? { get set }
    
    var userNameBorderColor: UIColor? { get }
    var passwordBorderColor: UIColor? { get }
    var loginButtonEnable: Bool { get }
    
    func userNameDidChange(text: String?)
    func passwordDidChange(text: String?)
    func login()
}


