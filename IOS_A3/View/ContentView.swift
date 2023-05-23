//
//  ContentView.swift
//  IOS_A3
//
//  Created by shihao lin on 23/5/2023.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .nowPlaying
    var body: some View {
        ZStack(alignment: .bottom){
            
            Group {
                switch selectedTab {
                case .nowPlaying:
                    NowPlayingView()
                case .comingSoon:
                    ComingSoonView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            TabBar()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
