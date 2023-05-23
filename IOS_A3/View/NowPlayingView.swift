//
//  NowPlayingView.swift
//  IOS_A3App
//
//  Created by shihao lin on 23/5/2023.
//

import SwiftUI

struct NowPlayingView: View {
    @ObservedObject var movieService = MovieService(url: URL(string: "https://api.themoviedb.org/3/movie/now_playing")!)
   
    
   
    
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            
            ScrollView {
                TabView {
                    ForEach(movieService.movies) { movie in
                        FeaturedItem(movie: movie)
                    }
                }
                .refreshable {
                    await movieService.fetchMovies()
                }
                .onAppear {
                    Task {
                        await movieService.fetchMovies()
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .frame(height: 600)
                .background(Image("Blob 1").offset(x: 50, y: 80))          
            }
            .safeAreaInset(edge: .top, content: {Color.clear.frame(height: 80)})
            .overlay(
                NavigationBar(title: "Now Playing")
            )
            
        }
       
    }
}
struct NowPlayingView_Previews: PreviewProvider {
    static var previews: some View {
        NowPlayingView()
    }
}
