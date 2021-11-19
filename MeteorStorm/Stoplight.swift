//
//  Stoplight.swift
//  MeteorStorm
//
//  Created by Luigi Luca Coletta on 17/11/21.
//

import SwiftUI

struct Stoplight: View {
    
    @State var isVisible = false
    @State var isActive = true
    
    var color: Color
    
    var body: some View {
        
        Circle()
            .fill(color)
            .frame(width: 167, height: 167)
            .padding(100.0)
    }
}
