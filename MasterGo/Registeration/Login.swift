//
//  Login.swift
//  MasterGo
//
//  Created aBoelghet  on 28/12/2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//  Generated using MVVM Module Generator by Mohamad Kaakati
//  https://github.com/Kaakati/MVVM-Template-Generator
//

/// Login Model
struct  Login {
    typealias didFetchSuccess = (Login)->()
    typealias didFailWithError = (Error?) -> ()
    
    // Your Model Structure
    var id : Int?
    var name : Int?
    
    func didFetch(withSuccess: @escaping didFetchSuccess, withError: @escaping didFailWithError) {
        withSuccess(Login())
        withError(nil)
    }
}
