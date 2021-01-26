//
//  ViewController.swift
//  TestNewsApp
//
//  Created by Balnur Sakhybekova on 1/25/21.
//  Copyright © 2021 Balnur Sakhybekova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var articleList = [Article]()
    lazy var tableView = UITableView(frame: .zero, style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadList()
        setUpNavigation()
        
        // Do any additional setup after loading the view.
    }
    
    
    private func setupUI(){
        view.addSubview(tableView)
        tableView.snp.makeConstraints { m in
            m.edges.equalToSuperview()
        }
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ArticleTableViewCell.self, forCellReuseIdentifier: "cell")
//        tableView.estimatedRowHeight = 200
    }
    
    private func loadList(){
        ArticleList.getArticles { (result) in
            switch result{
            case .success(let res):
                self.articleList = res.articles
                self.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    deinit {
        print("ArticleListViewController deinit")
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ArticleTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ArticleTableViewCell
        cell.articles = articleList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleList.count
    }
    
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
      return indexPath
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func setUpNavigation() {
        navigationItem.title = "Breaking News"
    }
    
//    func openDetail(for article: Article) {
//            if let art_id = article. {
//                let stringId = String(emp_id)
//                let vc = EmpDetailViewController(id: stringId)
//                // MARK: - Show view controller
//    //            self.present(vc, animated: true, completion: nil)
//                navigationController?.pushViewController(vc, animated: true)
//            }
//        }
}
