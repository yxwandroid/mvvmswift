//
//  ViewModel.swift
//  mvvmswift
//  逻辑层  将用户的行为 转化成输出的状态
//  1.  用户输入验证逻辑
//  2.  视图显示逻辑
//  3.  发起网络请求
//
//  Created by 杨学武 on 2018/5/29.
//  Copyright © 2018年 leedian. All rights reserved.
//
import UIKit
public class ViewModel: NSObject, ViewModelInterface {
    
    weak var delegate: ViewModelDelegate?
    
    var userNameBorderColor: UIColor? {
        return usernameValid ? UIColor.black : UIColor.red
    }
    var passwordBorderColor: UIColor? {
        return passwordValid ? UIColor.black : UIColor.red
    }
    
    var loginButtonEnable: Bool {
        return usernameValid && passwordValid
    }
    
    private var usernameValid = false
    private var passwordValid = false
    private var userName: String?
    private var password: String?
    
    func userNameDidChange(text: String?) {
        if (text?.characters.count)! < 6 {
            usernameValid = false
         
        } else {
               print("用户名长度不对")
            usernameValid = true
        }
        userName = text
        delegate?.reloadViews()
    }
    
    func passwordDidChange(text: String?) {
        if (text?.characters.count)! < 6 {
        
            passwordValid = false
        } else {
                    print("密码长度不对")
            passwordValid = true
        }
        password = text
        delegate?.reloadViews()
    }
    
    func login() {
        
        //  进行网络数据请求保存用户登录的信息 保存成功之后跳转界面
        
        
        delegate?.moveToHomeScreen()
    }
}

