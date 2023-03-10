//
// Created for Grids_iOS16
// by Stewart Lynch on 2022-08-10
// Using Swift 5.0
//
// Follow me on Twitter: @StewartLynch
// Subscribe on YouTube: https://youTube.com/StewartLynch
//

import SwiftUI

struct Introduction: View {
    @State private var sampleImage: SampleImage?
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    TitleRow(sampleImage: $sampleImage, title: "Cell Alignments and spans", image:  .Ex1)
                    //Grid Goes Here
                    TitleRow(sampleImage: $sampleImage, title: "Grid/Column/Row Alignments and Overrides", image:  .Ex2)
                    // Grid goes here
                    Spacer()
                }
                .navigationTitle("Introduction")
                .sheet(item: $sampleImage) { $0.withDismissButton().presentationDetents([.medium])}
            }
        }
    }
}


struct Introduction_Previews: PreviewProvider {
    static var previews: some View {
        Introduction()
    }
}


