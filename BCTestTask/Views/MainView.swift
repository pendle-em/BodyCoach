//
//  ContentView.swift
//  BCTestTask
//
//  Created by Emilia Tothova on 21/02/2024.
//

import SwiftUI

struct MainView {
    @ObservedObject var viewModel: MainViewModel
    @State private var pinnedContentHeight: CGFloat = 0
}

extension MainView: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                ScrollView {
                    VStack(spacing: 0) {
                        header
                        content
                            .padding(.bottom, pinnedContentHeight)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                            .background(Color.cobalt_50_550
                                .clipShape(TopSCurve())
                                .padding(.bottom, -geometry.safeAreaInsets.bottom))
                    }
                    .frame(
                        idealWidth: geometry.size.width,
                        maxWidth: geometry.size.width,
                        minHeight: geometry.size.height,
                        alignment: .top
                    )
                }
                .frame(width: geometry.size.width)
                
                pinned
                    .anchorBounds(key: "pinned-content")
            }
        }
        .background(Color.cobalt_500_white_0)
    }
    
    var header: some View {
        Text(viewModel.title)
            .foregroundStyle(Color.cobalt_50_550)
            .font(.largeTitle)
            .multilineTextAlignment(.center)
            .padding(.vertical, 32)
    }
    
    var content: some View {
        VStack {
            Text(viewModel.description)
                .font(.body)
                .padding(.top, 32)
                .foregroundStyle(Color.cobalt_500_white_0)
            HStack(spacing: 10) {
                ForEach(viewModel.cellViewModels) { cellViewModel in
                    StepCountCell(viewModel: cellViewModel)
                }
            }
        }
        .padding(12)
    }
    
    var contentBackground: some View {
        Color.cobalt_50_550
    }
    
    var pinned: some View {
        Button(action: viewModel.fetchStepsData) {
            ButtonTitleView(viewModel.buttonTitle)
        }
        .buttonStyle(CapsuleButtonStyle(.cobaltWhite))
        .comfortableReadingWidth()
        .padding(.horizontal, DesignConstants.gutterNarrow)
    }
}
