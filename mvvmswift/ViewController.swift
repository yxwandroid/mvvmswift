//
//
// MVVM的优缺点
// 使用MVVM会轻微的增加代码量，但总体上减少了代码的复杂性
//
//
//  ViewController.swift 主要负责数据的绑定
//  View 和ViewController 不能直接引用model  而是引用viewModel[(视图模型)
//
//  ViewController尽量不涉及业务逻辑  让ViewModel做业务逻辑相关的事情
//  ViewController 只是做中间人 接收view的事件调用ViewModel的方法 响应ViewModel的变化
//  Created by 杨学武 on 2018/5/29.
//  Copyright © 2018年 leedian. All rights reserved.
//

import UIKit
//import RxSwift
//import RxCocoa

class ViewController: UIViewController,ViewModelDelegate {

  
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var btnRxSwift: UIButton!
    var viewModel: ViewModel!
   // let bag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = ViewModel()
        viewModel.delegate = self
        
        userNameField.addTarget(self, action: #selector(userNameChanged), for: .editingChanged)
        passwordField.addTarget(self, action: #selector(passwordChanged), for: .editingChanged)
        
        reloadViews()
    
        // 类里面懒加载 DisposeBag 对象
  
        
//        // 增加点击监听
//        btnRxSwift.rx.tap.subscribe { (event: Event<()>) in
//            print("按钮1 被点")
//            }.disposed(by: bag)
//
       
    }
    //MARK: Action
    @objc dynamic func userNameChanged() {
        viewModel.userNameDidChange(text: userNameField.text)
    }
    
    @objc dynamic func passwordChanged() {
        viewModel.passwordDidChange(text: passwordField.text)
    }
    
   
    @IBAction func loginAction(_ sender: Any) {
            viewModel.login()
    }
  
    
    dynamic func reloadViews() {
        userNameField.layer.borderColor = viewModel.userNameBorderColor?.cgColor
        userNameField.layer.borderWidth = 3
        passwordField.layer.borderColor = viewModel.passwordBorderColor?.cgColor
        passwordField.layer.borderWidth = 3
        loginButton.isEnabled = viewModel.loginButtonEnable
    }
    
    
    
    func alertInfo() {
        
    }
    
    func moveToHomeScreen() {
        print("跳转")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

