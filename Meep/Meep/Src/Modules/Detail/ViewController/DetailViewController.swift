//
//  DetailView.swift
//  Meep
//
//  Created by Alvarez de Lorenzana, Guillermo on 12/4/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    private let input: DetailInput
    private let tableView: UITableView = UITableView(frame: .zero, style: .insetGrouped)
    
    init(input: DetailInput) {
        self.input = input
        super.init(nibName: nil, bundle: nil)
        tableView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureConstraints()
        input.update(event: .viewLoaded)
    }
    
    func configureConstraints() {
        setupViews()
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func setupViews() {
        tableView.register(DetailViewCell.self)
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
}

extension DetailViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        input.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        input.numberOfRowIn()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellInfo = input.detailCell(index: indexPath.row)
        let cell = tableView.dequeueReusableCell(for: indexPath) as DetailViewCell
        cell.binding(model: cellInfo)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        Strings.details
    }
}

extension DetailViewController: DetailOutput {
    func receive(state: DetailStates) {}
}



