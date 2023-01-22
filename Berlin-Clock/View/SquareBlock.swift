//
//  SquareBlocksView.swift
//  Berlin-Clock
//
//  Created by Daniel Caccia on 22/01/2023.
//

import UIKit

enum SquareBlocksType {
    case hours, firstMinutes, secondMinutes
}

class SquareBlock: Block {
    class Layout {
        static let height: CGFloat = 40
        static let cornerRadius: CGFloat = 25
        static let roundedTopLeft: CACornerMask = [.layerMinXMinYCorner]
        static let roundedBottomLeft: CACornerMask = [.layerMinXMaxYCorner]
        static let roundedBottomRight: CACornerMask = [.layerMaxXMaxYCorner]
        static let roundedTopRight: CACornerMask = [.layerMaxXMinYCorner]
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: Layout.height).isActive = true
      }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func roundCorners(_ side: RoundCorners) {
        self.layer.cornerRadius = Layout.cornerRadius
        switch side {
        case .topLeft:
            self.layer.maskedCorners = Layout.roundedTopLeft
        case .bottomLeft:
            self.layer.maskedCorners = Layout.roundedBottomLeft
        case .bottomRight:
            self.layer.maskedCorners = Layout.roundedBottomRight
        case .topRight:
            self.layer.maskedCorners = Layout.roundedTopRight
        }
    }
}
