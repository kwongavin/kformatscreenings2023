//
//  DashedDivider.swift
//  KFormatScreening
//
//  Created by Gavin Kwon on 3/31/23.
//

import SwiftUI

struct DashedDivider: View {
    var body: some View {
        GeometryReader { geo in
            Path { path in
                
                path.move(to: CGPoint.zero)
                path.addLine(to: CGPoint(x: geo.size.width, y: 0))
                
            }
            .stroke(style: StrokeStyle(lineWidth: 0.2, dash: [4]))
            .foregroundColor(.gray)
        }
        .frame(height: 1)
    }
}

struct DashedDivider_Previews: PreviewProvider {
    static var previews: some View {
        DashedDivider()
    }
}
