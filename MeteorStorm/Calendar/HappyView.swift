//
//  HappyView.swift
//  MeteorStorm
//
//  Created by Luigi Luca Coletta on 21/11/21.
//

import SwiftUI

struct HappyView: View {
    
    @Binding var rootIsActive: Bool
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct HappyView_Previews: PreviewProvider {
    static var previews: some View {
        HappyView(rootIsActive: .constant(true))
    }
}
