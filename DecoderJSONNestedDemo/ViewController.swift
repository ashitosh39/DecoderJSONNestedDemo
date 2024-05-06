//
//  ViewController.swift
//  DecoderJSONNestedDemo
//
//  Created by Macintosh on 27/12/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    private let ProductTableViewCellIdentifier = "ProductTableViewCell"
    
    var url :  URL?
    var urlRequest : URLRequest?
    var jsonDecoder : JSONDecoder?
    var posts : [Post] = []
    override func viewDidLoad() {
        super.viewDidLoad()
       jsonParsingUsingDecoder()
        initializeTableView()
        registerXIBWithTableView()
        
    }
    func initializeTableView(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func registerXIBWithTableView(){
        let uiNib = UINib(nibName: ProductTableViewCellIdentifier, bundle: nil)
        self.tableView.register(uiNib, forCellReuseIdentifier: ProductTableViewCellIdentifier)
    }
func jsonParsingUsingDecoder(){
url = URL(string: "https://jsonplaceholder.typicode.com/posts")
    urlRequest = URLRequest(url: url!)
    var dataTask = URLSession.shared.dataTask(with: urlRequest!) { data, response, error in
        self.jsonDecoder = JSONDecoder()
        self.posts = try!
        self.jsonDecoder!.decode([Post].self, from: data!)
        print(self.posts)
    }
    dataTask.resume()
}
}
extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = self.tableView.dequeueReusableCell(withIdentifier: ProductTableViewCellIdentifier, for: indexPath) as! ProductTableViewCell
        tableViewCell.idLabel.text = String(posts[indexPath.row].id)
        tableViewCell.userIdLabel.text = String(posts[indexPath.row].userId)
        tableViewCell.bodyLabel.text = String(posts[indexPath.row].body)
        tableViewCell.titalLabel.text = String(posts[indexPath.row].title)
        return tableViewCell
    }
    
    
}

extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        250.00
        
    }
}
