//
//  ComingSoonView.swift
//  IOS_A3App
//
//  Created by shihao lin on 23/5/2023.
//

import SwiftUI

struct ComingSoonView: View {
    @State var show = false
    @Namespace var namespace
    @State var showStatusBar = true
    @State var selectedID = UUID()
    @ObservedObject var movieService = MovieService(url: URL(string: "https://api.themoviedb.org/3/movie/top_rated")!)
    
    var body: some View {
        ZStack {
            //            Color("Background").ignoresSafeArea()
            
            ScrollView {
                
                if !show {
                    ForEach(movieService.movies) { movie in
                        MovieDetailItem(movie: movie, namespace: namespace, show: $show)
                            .onTapGesture{
                                withAnimation(.openCard) {
                                    show.toggle()
                                    showStatusBar = false
                                    selectedID = movie.uuid
                                }
                            }
                    }
                } else {
                    ForEach(movieService.movies) {movie in
                        Rectangle()
                            .fill(.white)
                            .frame(height: 300)
                            .cornerRadius(30)
                            .shadow(color: Color("Shadow"), radius: 20, x: 0, y: 10)
                            .opacity(0.3)
                            .padding(.horizontal, 30)
                    }
                }
                
            }
            .safeAreaInset(edge: .top, content: {Color.clear.frame(height: 80)})
            .overlay(
                NavigationBar(title: "Top Rate")
            )
            .refreshable {
                await movieService.fetchMovies()
            }
            .onAppear {
                Task {
                    await movieService.fetchMovies()
                }
            }
            
            if show {
                ForEach(movieService.movies) { movie in
                    if movie.uuid == selectedID{
                        MovieDetailView(namespace: namespace, movie: movie, show: $show)
                    }
                }
            }
        }
        .statusBar(hidden: !showStatusBar)
        .onChange(of: show) { newValue in
            withAnimation(.closeCard){
                if newValue {
                    showStatusBar = false
                    
                } else {
                    showStatusBar = true
                }
            }
        }
    }
}

struct ComingSoonView_Previews: PreviewProvider {
    static var previews: some View {
        ComingSoonView()
    }
}
