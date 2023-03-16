//
//  ShowListView.swift
//  KFormatScreening
//
//  Created by Gavin Kwon on 3/16/23.
//

import SwiftUI

struct ShowRectangle: View {
    
    var color = Color.white
    
    var body: some View {
        
        Rectangle()
            .foregroundColor(color)
            .cornerRadius(10)
            .shadow(radius: 5)
            .padding()
    }
}

struct ShowListView_Previews: PreviewProvider {
    static var previews: some View {
        ShowRectangle()
    }
}
