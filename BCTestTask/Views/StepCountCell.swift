//
//  StepCountCell.swift
//  BCTestTask
//
//  Created by Emma Pendlebury on 03/03/2024.
//

import SwiftUI

struct StepCountCell: View {
    let viewModel: StepCountCellViewModel
}

extension StepCountCell {
    var body: some View {
        textStack
            .frame(maxWidth: .infinity)
            .padding(.vertical, DesignConstants.StepCountCell.largeSpacing)
            .padding(.horizontal, DesignConstants.StepCountCell.smallSpacing)
            .foregroundStyle(Color.cobalt_50_550)
            .background(Color.cobalt_500_1000)
            .clipShape(RoundedRectangle(cornerRadius: DesignConstants.StepCountCell.largeSpacing))
    }
    
    private var textStack: some View {
        VStack(spacing: DesignConstants.StepCountCell.largeSpacing) {
            Text(viewModel.day.description)
                .font(.title3)
            Text(viewModel.steps)
                .font(.caption)
        }
    }
}
