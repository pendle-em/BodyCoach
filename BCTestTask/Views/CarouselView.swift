//
//  CarouselView.swift
//  BCTestTask
//
//  Created by Emma Pendlebury on 03/03/2024.
//

import SwiftUI

struct Carousel: View {
    let width: CGFloat
    
    @Binding var cellViewModels: [StepCountCellViewModel]
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize: DynamicTypeSize
}

extension Carousel {
    var body: some View {
        cells
    }
    
    @ViewBuilder
    private var cells: some View {
        if dynamicTypeSize > .large {
            ScrollView(.horizontal, showsIndicators: false) {
                cellStack
            }
        } else {
            cellStack
        }
    }
    
    private var cellStack: some View {
        return HStack(spacing: 8) {
            ForEach(cellViewModels) { cellViewModel in
                StepCountCell(viewModel: cellViewModel)
                    .frame(minWidth: minCellWidth)
            }
        }
        .padding(14)
    }
}

extension Carousel {
    private var minCellWidth: CGFloat {
        let numberOfCells = CGFloat(cellViewModels.count)
        let numberOfSpaces = numberOfCells - 1
        let totalSpacing = (14 * 2) + (8 * numberOfSpaces)
        return (width - totalSpacing) / numberOfCells
    }
}
