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
    @State private var showDeleteAlert: Bool = false
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
    // NavigationView로 .toolbar를 감싸야함!
    NavigationView {
        VStack {
            ScrollView {
                VStack {
                    Text(memo.insertDate, style: .date)
                        .padding()
                        .font(.footnote)
                        .foregroundColor(.secondary)
                    HStack {
                        Text(memo.content)
                            .padding()
                        Spacer(minLength: 0)
                    }
                }
            }
            
        }
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                Button  {
                    showDeleteAlert = true
                } label: {
                    Image(systemName:  "trash")
                }
                .foregroundColor(.red)
                .alert("삭제 확인", isPresented: $showDeleteAlert) {
                    Button(role: .destructive) {
                        store.delete(memo: memo)
                        dismiss()
                    } label: {
                        Text("삭제")
                    }
                } message: {
                    Text("메모를 삭제할까요?")
                }
                
                Button {
                    showCompoesr = true
                } label: {
                    Image(systemName:  "square.and.pencil")
                }
            }
        }
    }
    .navigationTitle("메모 보기")
    .navigationBarTitleDisplayMode(.inline)
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
