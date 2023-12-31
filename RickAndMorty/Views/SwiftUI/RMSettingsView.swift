//
//  RMSettingsView.swift
//  RickAndMorty
//
//  Created by Gabriel Roveri on 09/07/23.
//

import SwiftUI

struct RMSettingsView: View {
    let viewModel: RMSettingsViewViewModel
    
    init(viewModel: RMSettingsViewViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List(viewModel.cellViewModels) { viewModel in
            return HStack {
                if let image = viewModel.image {
                    Image(uiImage: image)
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(.white)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        .padding(8)
                        .background(Color(viewModel.iconContainerColor))
                        .cornerRadius(6)
                }
                Text(viewModel.title)
                    .padding(.leading, 10)
                Spacer()
            }
            .padding(.bottom, 5)
            .onTapGesture {
                viewModel.onTapHandler(viewModel.type)
            }
        }
    }
}

struct RMSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        return RMSettingsView(
            viewModel:
                    .init(cellViewModels:
                            RMSettingsOption.allCases.compactMap({ return .init(type: $0) { dump($0) }})
                         )
        )
    }
}

// This only works on iOS 17.0 and Xcode 15, also works on UIKit (Swift Macros)

//#Preview {
//    RMSettingsView(viewModel: .init(cellViewModels:
//                                        RMSettingsOption.allCases.compactMap({
//        return .init(type: $0) {
//            dump($0)
//        }
//    })))
//}
