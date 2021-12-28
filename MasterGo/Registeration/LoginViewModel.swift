//
//  LoginViewModel.swift
//  MasterGo
//
//  Created aBoelghet  on 28/12/2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//  Generated using MVVM Module Generator by Mohamad Kaakati
//  https://github.com/Kaakati/MVVM-Template-Generator
//

import Foundation

protocol LoginViewModelProtocol {
    func fetchData()
    func didReceiveUISelect(object: Login)
}

class LoginViewModel {
    var view : LoginViewProtocol!
    var object = Login()
    
    func fetchData() {
        object.didFetch(withSuccess: { (success) in
            self.view.viewWillPresent(data: success)
        }) { (err) in
            debugPrint("Error happened", err as Any)
        }
    }
    
    func didReceiveUISelect(object: Login) {
        debugPrint("Did receive UI object", object)
    }
}