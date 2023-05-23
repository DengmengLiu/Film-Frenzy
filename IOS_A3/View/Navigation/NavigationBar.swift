//
//  NavigationBar.swift
//  IOS_A3App
//
//  Created by shihao lin on 23/5/2023.
//

import SwiftUI

struct NavigationBar: View {
    var title = ""
    @State var showAccount = false
    
    var body: some View {
        ZStack{
            Color.clear
                .background(.ultraThinMaterial)
                .blur(radius: 10)
            Text(title)
                .font(.largeTitle.weight(.bold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20)
            Button {
                showAccount = true
            } label: {
                Image("Avatar Default")
                    .resizable()
                    .frame(width: 26, height: 26)
                    .cornerRadius(10)
                    .padding(8)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
            }
            .sheet(isPresented: $showAccount){
                AccountView()
            }
        
                .frame( maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing, 20)
        }
            .frame(height: 70)
            .frame(maxHeight: .infinity, alignment: .top)
   
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar()
    }
}
