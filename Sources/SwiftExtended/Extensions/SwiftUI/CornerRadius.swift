//
//  CornerRadius.swift
//  
//
//  Created by vladIcedigital on 11.08.2021.
//
// Implements a way of clipping certain corner.
// IMPORTANT: This fixes non-selectable widgets bug on Apple TV
//

import SwiftUI
import UIKit


public extension View {
    func cornerRadius(radius: CGFloat, _ corners: UIRectCorner = .allCorners) -> some View {
        return clipShape(RoundedCorners(radius, corners))
    }
}

struct RoundedCorners: Shape {
    init(_ radius: CGFloat, _ corners: UIRectCorner) {
        self.radius = radius
        self.corners = corners
    }
    
    let radius: CGFloat
    let corners: UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
