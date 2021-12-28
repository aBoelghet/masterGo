//
//  LoginView.swift
//  MasterGo
//
//  Created aBoelghet  on 28/12/2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//  Generated using MVVM Module Generator by Mohamad Kaakati
//  https://github.com/Kaakati/MVVM-Template-Generator
//

import UIKit

protocol LoginViewProtocol {
    func viewWillPresent(data: Login)
}

class LoginView: UIViewController, LoginViewProtocol {
    
    private var ui = LoginUI()
    var viewModel : LoginViewModel! {
        willSet {
            newValue.view = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel.fetchData()
    }
    
    override func loadView() {
        ui.delegate = self
        view = ui
    }
    
    func viewWillPresent(data: Login) {
        ui.object = data
    }
}

extension LoginView : LoginUIDelegate {
    func uiDidSelect(object: Login) {
        viewModel.didReceiveUISelect(object: object)
    }
}
