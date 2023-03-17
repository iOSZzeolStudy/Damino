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
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(memo: Memo(content: "Hello"))
            .environmentObject(MemoStore())
    }
}
