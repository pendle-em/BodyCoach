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
                        content(geometry: geometry)
                    }
                    .frame(
                        idealWidth: geometry.size.width,
                        maxWidth: geometry.size.width,
                        minHeight: geometry.size.height,
                        alignment: .top
                    )
                }
                .frame(width: geometry.size.width)
                
                pinnedButton
                    .anchorBounds(key: "pinned-content")
            }
        }
        .background(Color.cobalt_500_white_0)
    }
    
    private var header: some View {
        Text(viewModel.title)
            .foregroundStyle(Color.cobalt_50_550)
            .font(.largeTitle)
            .multilineTextAlignment(.center)
            .padding(.vertical, 32)
    }
    
    private var description: some View {
        Text(viewModel.description)
            .font(.body)
            .padding(.top, 32)
            .foregroundStyle(Color.cobalt_500_white_0)
    }
    
    private var contentBackground: some View {
        Color.cobalt_50_550
    }

    private var pinnedButton: some View {
        Button(action: {
            Task {
                try await viewModel.fetchStepsData()
            }
        }, label: {
            ButtonTitleView(viewModel.buttonTitle)
        })
        .buttonStyle(CapsuleButtonStyle(.cobaltWhite))
        .comfortableReadingWidth()
        .padding(.horizontal, DesignConstants.gutterNarrow)
    }
    
    private func content(geometry: GeometryProxy) -> some View {
        VStack {
            description
            Carousel(
                width: geometry.size.width,
                cellViewModels: $viewModel.cellViewModels
            )
        }
        .padding(.bottom, pinnedContentHeight)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(
            Color.cobalt_50_550
                .clipShape(TopSCurve())
                .padding(.bottom, -geometry.safeAreaInsets.bottom)
        )
    }
}

//struct MainView_Preview: PreviewProvider {
//    static var previews: some View {
//        MainView(viewModel: MainViewModel())
//    }
//}
