//
//  Extension.swift
//  MeteorStorm
//
//  Created by Vincenzo Pascarella on 22/11/21.
//
import SwiftUI

extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}
