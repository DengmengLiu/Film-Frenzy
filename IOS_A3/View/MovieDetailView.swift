//
//  MovieDetailView.swift
//  IOS_A3
//
//  Created by shihao lin on 23/5/2023.
//

import SwiftUI

struct MovieDetailView: View {
    var namespace : Namespace.ID
    var movie : Movie
    @Binding var show : Bool
    
    var body: some View {
        ZStack {
            ScrollView {
                cover
                
                content
            }
            .background(Color("Background"))
            .ignoresSafeArea()
            
            button
            
            
        }
        
    }
    var cover: some View {
        VStack{
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 700)
        .foregroundStyle(.black)
        .background(
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w1280/" + (movie.posterPath))) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .matchedGeometryEffect(id: "Background\(movie.uuid)", in: namespace)
            } placeholder: {
                ProgressView()
            }
        )
        .mask(
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .matchedGeometryEffect(id: "mask\(movie.uuid)", in: namespace)
        )
        .overlay(
            VStack(alignment: .leading, spacing: 12){
                Text(movie.title)
                    .font(.largeTitle.weight(.bold))
                    .matchedGeometryEffect(id: "title\(movie.uuid)", in: namespace)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Release Date：" + movie.releaseDate)
                    .font(.footnote.weight(.semibold))
                    .matchedGeometryEffect(id: "releaseDate\(movie.uuid)", in: namespace)
                
                Text("Original Language: " + movie.originalLanguage)
                    .font(.footnote)
                    .matchedGeometryEffect(id: "overview\(movie.uuid)", in: namespace)
                
                Text("Vote Count: " + String(movie.voteCount))
                    .font(.footnote)
                    .matchedGeometryEffect(id: "voteCount\(movie.uuid)", in: namespace)
                
                Text("Average vote score: " + String(movie.voteAverage))
                    .font(.footnote.weight(.semibold))
                    .matchedGeometryEffect(id: "voteAverage\(movie.uuid)", in: namespace)
                
            }
                .padding(20)
                .background(
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                        .matchedGeometryEffect(id: "blur", in: namespace)
                )
                .offset(y: 250)
                .padding(20)
        )
        
    }
    
    var content: some View{
        VStack(alignment: .leading, spacing: 40){
            Text("Overview")
                .font(.title).bold()
            Text(movie.overview)
                .font(.title3).fontWeight(.medium)
            Text("--END--")
                .font(.title3).fontWeight(.medium)
        }
        .padding(30)
    }
    
    var button: some View {
        Button {
            withAnimation(.closeCard){
                show.toggle()
            }
        } label: {
            Image(systemName: "xmark")
                .font(.body.weight(.bold))
                .foregroundColor(.secondary)
                .padding(8)
                .background(.ultraThinMaterial, in: Circle())
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        .padding(20)
        .ignoresSafeArea()
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    @Namespace static var namespace
    static var dummyMovie: Movie = Movie(adult: false,
                                              backdropPath: "/tmU7GeKVybMWFButWEGl2M4GeiP.jpg",
                                              genreIds: [1, 2, 3],
                                              id: 123,
                                              originalLanguage: "en",
                                              originalTitle: "Original Title",
                                              overview: "Over many missions and against impossible odds, Dom Toretto and his family have outsmarted, out-nerved and outdriven every foe in their path. Now, they confront the most lethal opponent they've ever faced: A terrifying threat emerging from the shadows of the past who's fueled by blood revenge, and who is determined to shatter this family and destroy everything—and everyone—that Dom loves, forever.",
                                              popularity: 123.45,
                                              posterPath: "/1E5baAaEse26fej7uHcjOgEE2t2.jpg",
                                              releaseDate: "2023-05-17",
                                              title: "Fast X",
                                              video: false,
                                              voteAverage: 7.8,
                                              voteCount: 123)
    
    static var previews: some View {
        MovieDetailView(namespace: namespace, movie: dummyMovie, show: .constant(true))
    }
}
