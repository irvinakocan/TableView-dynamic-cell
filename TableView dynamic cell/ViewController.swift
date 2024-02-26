//
//  ViewController.swift
//  TableView dynamic cell
//
//  Created by Macbook Air 2017 on 22. 2. 2024..
//

import UIKit

class ViewController: UIViewController {
    
    let data = [
        "The ultimate form of intrinsic motivation is when a habit becomes part of your identity. It’s one thing to say I’m the type of person who wants this. It’s something very different to say I’m the type of person who is this.",
        "On any given day, you may struggle with your habits because you’re too busy or too tired or too overwhelmed or hundreds of other reasons. Over the long run, however, the real reason you fail to stick with habits is that your self-image gets in the way. This is why you can’t get too attached to one version of your identity. Progress requires unlearning.",
        "There are a set of beliefs and assumptions that shape the system, an identity behind the habits.",
        "Of course, your habits are not the only actions that influence your identity, but by virtue of their frequency they are usually the most important ones. Each experience in life modifies your self-image, but it’s unlikely you would consider yourself a soccer player because you kicked a ball once or an artist because you scribbled a picture. As you repeat these actions, however, the evidence accumulates and your self- image begins to change. The effect of one-off experiences tends to fade away while the effect of habits gets reinforced with time, which means your habits contribute most of the evidence that shapes your identity. In this way, the process of building habits is actually the process of becoming yourself.",
        "Many people begin the process of changing their habits by focusing on what they want to achieve. This leads us to outcome-based habits. The alternative is to build identity-based habits. With this approach, we start by focusing on who we wish to become.",
        "Breakthrough moments are often the result of many previous actions, which build up the potential required to unleash a major change. This pattern shows up everywhere. Cancer spends 80 percent of its life undetectable, then takes over the body in months. Bamboo can barely be seen for the first five years as it builds extensive root systems underground before exploding ninety feet into the air within six weeks.",
        "Your outcomes are a lagging measure of your habits. Your net worth is a lagging measure of your financial habits. Your weight is a lagging measure of your eating habits. Your knowledge is a lagging measure of your learning habits. Your clutter is a lagging measure of your cleaning habits. You get what you repeat."
    ]
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(TextTableViewCell.self, forCellReuseIdentifier: TextTableViewCell.identifier)
        
        // We put these two commands so cell can calculate it's dynamic height.
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 80
        
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setTableView()
    }

    private func setTableView() {
        view.addSubview(tableView)
        tableView.backgroundColor = .systemPink
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let paragraphText = data[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TextTableViewCell.identifier, for: indexPath) as? TextTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(text: paragraphText)
        return cell
    }
}
