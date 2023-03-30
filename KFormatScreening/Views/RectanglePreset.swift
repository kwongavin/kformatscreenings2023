//
//  ShowListView.swift
//  KFormatScreening
//
//  Created by Gavin Kwon on 3/16/23.
//

import SwiftUI

struct RectanglePreset: View {
    
//    var color = Colo0r.mint
    
    var body: some View {
        
        Rectangle()
//            .foregroundColor(color)
            .cornerRadius(10)
//            .shadow(radius: 5)
    }
}

struct RectanglePreset_Previews: PreviewProvider {
    static var previews: some View {
        RectanglePreset()
    }
}
