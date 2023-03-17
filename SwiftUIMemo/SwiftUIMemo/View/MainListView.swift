//
//  MainListView.swift
//  SwiftUIMemo
//
//  Created by 김담인 on 2023/03/16.
//

import SwiftUI

struct MainListView: View {
    @EnvironmentObject var store: MemoStore
    
    @State private var showComposer: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(store.list) { memo in
                    NavigationLink {
                        DetailView(memo: memo)
                    } label: {
                        MemoCell(memo: memo)
                    }
                }
                .onDelete(perform: store.delete)
            }
            .listStyle(.plain)
            .navigationTitle("내 메모")
            .toolbar {
                Button {
                    showComposer = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            // showComposer가 트루로 바뀌면 모달방식으로 ComposeView를 띄워줌
            .sheet(isPresented: $showComposer) {
                ComposeView()
            }
                
        }
        //요거 없으면 DetailView에서 툴바 아이콘이 표시가 안됨
        .navigationViewStyle(.stack)
    }
}

struct MainListView_Previews: PreviewProvider {
    static var previews: some View {
        MainListView()
            .environmentObject(MemoStore())
    }
}

