//
//  ViewController.swift
//  Joke
//
//  Created by Ирина on 02.09.2020.
//  Copyright © 2020 Ирина. All rights reserved.
//

import UIKit

func getRandomJoke(block: (_ textJoke: String) -> Void) {
    if let urlRandomJoke = URL(string: "https://api.chucknorris.io/jokes/random") {
        if let dataJson = try? Data(contentsOf: urlRandomJoke) {
            if let jsonDict = try? JSONSerialization.jsonObject(with: dataJson, options: JSONSerialization.ReadingOptions.allowFragments) {
                if let joke = (jsonDict as! NSDictionary).object(forKey: "value") as? String {
                    block(joke)
                    return
                }
            }
        }
    }
    block("")
}

class ViewController: UIViewController {
    @IBOutlet weak var textViewJoke: UITextView!
    
    @IBAction func pushRefreshButtonAction(_ sender: Any) {
        getRandomJoke { (jokeText) in
            self.textViewJoke.text = jokeText
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

