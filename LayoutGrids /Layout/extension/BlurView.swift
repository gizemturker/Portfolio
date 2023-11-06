//
//  BlurView.swift
//  Layout
//
//  Created by Gizem Turker on 30.09.2023.
//

import protocol SwiftUI.UIViewRepresentable
import UIKit

public extension UIBlurEffect {
  struct View {
    let blurStyle: Style
  }
}

// MARK: - UIViewRepresentable
extension UIBlurEffect.View: UIViewRepresentable {
  public func makeUIView(context _: Context) -> UIVisualEffectView {
    .init(effect: UIBlurEffect(style: blurStyle))
  }
}
