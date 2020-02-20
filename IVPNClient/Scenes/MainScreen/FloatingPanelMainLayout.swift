//
//  FloatingPanelMainLayout.swift
//  IVPNClient
//
//  Created by Juraj Hilje on 19/02/2020.
//  Copyright © 2020 IVPN. All rights reserved.
//

import Foundation
import FloatingPanel

class FloatingPanelMainLayout: FloatingPanelLayout {
    
    // MARK: - Override public properties -
    
    public var initialPosition: FloatingPanelPosition {
        if UIDevice.current.userInterfaceIdiom == .pad {
            return .full
        }
        
        return .half
    }
    
    public var supportedPositions: Set<FloatingPanelPosition> {
        if UIDevice.current.userInterfaceIdiom == .pad {
            return [.full]
        }
        
        return [.full, .half, .tip]
    }
    
    // MARK: - Override public methods -

    public func insetFor(position: FloatingPanelPosition) -> CGFloat? {
        if UIDevice.current.userInterfaceIdiom == .pad {
            switch position {
            case .full: return -20
            default: return nil
            }
        }
        
        switch position {
            case .full: return 16
            case .half: return 216
            case .tip: return 44
            default: return nil
        }
    }

    public func prepareLayout(surfaceView: UIView, in view: UIView) -> [NSLayoutConstraint] {
        if UIDevice.current.userInterfaceIdiom == .pad {
            return [
                surfaceView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 0),
                surfaceView.widthAnchor.constraint(equalToConstant: 375)
            ]
        }
        
        return [
            surfaceView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 0),
            surfaceView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 0),
        ]
    }
    
    public func backdropAlphaFor(position: FloatingPanelPosition) -> CGFloat {
        if position == .full && UIDevice.current.userInterfaceIdiom != .pad {
            return 0.3
        }
        
        return 0
    }
    
}
