//
//  DetailView.swift
//  SwiftUIMemo
//
//  Created by 김담인 on 2023/03/17.
//

import SwiftUI

struct DetailView: View {
    //Memo에 Published로 설정한 속성이 바뀌면 뷰도 바뀜
    @ObservedObject var memo: Memo
    
    @EnvironmentObject var store: MemoStore
    
    @State private var showCompoesr: Bool = false
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    HStack {
                        Text(memo.content)
                            .padding()
                        Spacer(minLength: 0)
                    }
                    Text(memo.insertDate, style: .date)
                        .padding()
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
            }
        }
        .navigationTitle("메모 보기")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                Button {
                    showCompoesr = true
                } label: {
                    Image(systemName:  "square.and.pencil")
                }
            }
        }
        .sheet(isPresented: $showCompoesr) {
            ComposeView(memo: memo)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(memo: Memo(content: "Hello"))
                .environmentObject(MemoStore())
        }
    }
}
