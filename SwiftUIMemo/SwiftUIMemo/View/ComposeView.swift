//
//  ComposeView.swift
//  SwiftUIMemo
//
//  Created by 김담인 on 2023/03/16.
//

import SwiftUI

struct ComposeView: View {
    @EnvironmentObject var store: MemoStore
    @Environment(\.dismiss) var dismiss
    @State private var content: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                // content가 변경되면 그게 editor에 기록되고, eiditor에 text가 들어오면 content에 저장됨
                // 둘다 서로 바인딩 되어있어 two-way 바인딩
                TextEditor(text: $content)
                    .padding()
            }
            .navigationTitle("새 메모")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading)
                {
                    Button {
                        dismiss()
                    } label: {
                        Text("취소")
                    }
                }
            }
        }
    }
}

struct ComposeView_Previews: PreviewProvider {
    static var previews: some View {
        ComposeView()
            .environmentObject(MemoStore())
    }
}
