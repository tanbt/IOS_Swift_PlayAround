//
//  ViewController.swift
//  FirstIOSApp
//
//  Created by TanMacVbox on 4/11/17.
//  Copyright © 2017 TanMacVbox. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var favouriteMovies: [Movie] = []
    @IBOutlet var mainTableView: UITableView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "searchMoviesSegue" {
            let controller = segue.destination as! SearchViewController
            controller.delegate = self
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favouriteMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let moviecell = tableView.dequeueReusableCell(withIdentifier: "customcell", for: indexPath) as! CustomTableViewCell
        
        let idx: Int = indexPath.row
        moviecell.movieLabel?.text = favouriteMovies[idx].title
        moviecell.movieYear?.text = favouriteMovies[idx].year
        displayMovieImage(row: idx, moviecell: moviecell)
        
        return moviecell
    }
    
    func displayMovieImage (row: Int, moviecell: CustomTableViewCell) {
        let url: String = (URL(string: favouriteMovies[row].imageUrl)?.absoluteString)!
        URLSession.shared.dataTask(with: URL(string:url)!, completionHandler: {(data, response, error) -> Void in
            if error != nil {
                print(error!)
                return
            }
            
            DispatchQueue.main.async(execute: {
                let image = UIImage(data: data!)
                moviecell.movieImageView?.image = image
            })
        }).resume()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        mainTableView.reloadData();
        if favouriteMovies.count == 0 {
            favouriteMovies.append(Movie(id: "ID123456", title: "This is the title", year: "2017", imageUrl: "https://images-na.ssl-images-amazon.com/images/M/MV5BMjE1ODgwOTkzNF5BMl5BanBnXkFtZTgwMDcwMTg5MTI@._V1_SY1000_CR0,0,674,1000_AL_.jpg"))
        }
        
        super.viewWillAppear(animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

