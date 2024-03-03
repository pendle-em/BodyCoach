//
//  DesignConstants.swift
//  BCTestTask
//
//  Created by Emilia Tothova on 26/02/2024.
//

import SwiftUI

enum DesignConstants {
    enum Carousel {
        static let spacing: CGFloat = 8
        static let padding: CGFloat = 14
    }
    
    enum FloatingCTA {
        // Padding irrespective of safe area insets
        static let horizontalPadding: CGFloat = 52
        static let bottomPadding: CGFloat = 49
    }
    
    enum StepCountCell {
        static let largeSpacing: CGFloat = 10
        static let smallSpacing: CGFloat = 2
    }

    static let comfortableReadingWidth: CGFloat = 672
    static let gutter: CGFloat = 32
    static let gutterNarrow: CGFloat = 24
    static let gutterExtraNarrow: CGFloat = 16
    static let padding: CGFloat = 32

    static let scrollingContentBottomPadding: CGFloat = 56
    static let buttonKerning: CGFloat = 1.68
    static let buttonDisabledOpacity = 0.4
    static let buttonHighlightedOpacity = 0.6
}
