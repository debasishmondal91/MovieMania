//
//  MoviesListViewModel.swift
//  MovieMania
//
//  Created by Debasish Mondal on 09/07/22.
//

import Foundation

class MoviesListViewModel: ObservableObject{
    
    @Published var movies = [Movie]()
    
    func getMovies(){
        
        let queryItems = [URLQueryItem(name: "api_key", value: "API_KEY")]
        var urlComp = URLComponents(string: "https://api.themoviedb.org/3/movie/popular")
        urlComp?.queryItems = queryItems
        let url = urlComp?.url
        
        let task = URLSession.shared.dataTask(with: url!){
            (data,_,error) in
            
            guard let movies = data, error == nil else{return}
            
            do{
                let movieData = try JSONDecoder().decode(MoviesResponce.self, from: movies)
                DispatchQueue.main.async {
                    self.movies = movieData.movies
                }
            }catch{
                print(error)
            }
        }
        task.resume()
    }
}
