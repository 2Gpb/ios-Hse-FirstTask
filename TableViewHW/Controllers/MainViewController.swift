//
//  ViewController.swift
//  TableViewHW
//
//  Created by Peter on 15.10.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Properties

    var data: [String] = ["Caesar salad"]
    
    // MARK: - Subviews

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.register(
            MainCell.self,
            forCellReuseIdentifier: MainCell.identifier
        )
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    private lazy var addButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.setTitle("Add a dish", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 16.0
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addAction(UIAction {[weak self] _ in
            guard let self else { return }
            
            let vc = AddViewController()
//            vc.modalPresentationStyle = .fullScreen
            vc.delegate = self
            self.navigationController?.pushViewController(vc, animated: true)
            
        }, for: .touchUpInside)
        return button
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
    }

    // MARK: - Methods

    private func configureUI() {
        view.backgroundColor = .white

        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -4.0)
        ])

        view.addSubview(addButton)

        NSLayoutConstraint.activate([
            addButton.heightAnchor.constraint(equalToConstant: 44.0),
            addButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20.0),
            addButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            addButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0.0)
        ])
    }

    private func showAlert() {
        let alert = UIAlertController(
            title: "Nutritional value",
            message: "PFC",
            preferredStyle: .actionSheet
        )

        let logoutAction = UIAlertAction(title: "Ok", style: .default)

        alert.addAction(logoutAction)

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)

        alert.addAction(cancelAction)

        present(alert, animated: true)
    }
    
}

    // MARK: - UITableViewDataSource

extension MainViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: MainCell.identifier
        ) as? MainCell else {
            return UITableViewCell()
        }

        cell.configure(title: data[indexPath.row]) { [weak self] in
            self?.showAlert()
        }

        return cell
    }
}

    // MARK: - UITableViewDelegate

extension MainViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(data[indexPath.row])
    }
}

    // MARK: - AddViewControllerDelegate

extension MainViewController: AddViewControllerDelegate {
    
    func update(name: String, protein: String, fats: String, carbs: String, Kcal: String) {
        data.append(name)
        
        tableView.reloadData()
    }
    
}
 


