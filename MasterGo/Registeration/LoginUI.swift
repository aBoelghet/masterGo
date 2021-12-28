//
//  LoginUI.swift
//  MasterGo
//
//  Created aBoelghet  on 28/12/2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//  Generated using MVVM Module Generator by Mohamad Kaakati
//  https://github.com/Kaakati/MVVM-Template-Generator
//

import UIKit

protocol LoginUIDelegate {
    func uiDidSelect(object: Login)
}

class LoginUI : UIView {
    var delegate: LoginUIDelegate!
    
    var object : Login?

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
}
