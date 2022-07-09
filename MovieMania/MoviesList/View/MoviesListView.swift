//
//  MoviesListView.swift
//  MovieMania
//
//  Created by Debasish Mondal on 09/07/22.
//

import Foundation
import SwiftUI

struct MoviesListView: View{
    
    @StateObject var viewModel = MoviesListViewModel()
    
    var body: some View{
        
        NavigationView{
            List{
                ForEach(viewModel.movies){ movie in
                    
                    HStack{
                        AsyncImage(url: URL(string: "\(movie.posterURL)")) {image in
                            image.resizable()
                            
                        }placeholder: {
                            ProgressView()
                        }.frame(width: 120, height: 120)
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                        
                        Text(movie.originalTitle)
                            .bold()
                        
                    }.padding(3)
                    
                }
            }.navigationTitle("Popular Movies")
        }
        .onAppear{
            viewModel.getMovies()
        }
    }
}


struct MoviesListView_Preview: PreviewProvider{
    
    static var previews: some View{
        MoviesListView()
    }
}
