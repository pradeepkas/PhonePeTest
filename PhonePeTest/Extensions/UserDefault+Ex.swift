//
//  UserDefault+Ex.swift
//  Demo
//
//  ""
//

import Foundation


extension UserDefaults {

   private enum Keys {
        static let jsonData = "keyPhonePay1"
    }
    
    public class var jsonData: Data? {
        get {
            return UserDefaults.standard.data(forKey: Keys.jsonData)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Keys.jsonData)
        }
    }



}
