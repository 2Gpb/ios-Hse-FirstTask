//
//  MainCell.swift
//  TableViewHW
//
//  Created by Peter on 15.10.2023.
//

import UIKit

final class MainCell: UITableViewCell {

    // MARK: - Identifier

    static let identifier = "MainCell"

    // MARK: - Properties

    private var onTapButton: (() -> Void)?

    // MARK: - Subviews

    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var button: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "info.circle"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addAction(
            .init { [weak self] _ in
                self?.onTapButton?()
            },
            for: .touchUpInside
        )
        return button
    }()

    // MARK: - Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func prepareForReuse() {
        super.prepareForReuse()
        label.text = nil
    }

    // MARK: - Methods

    func configure(title: String, onTapButton: (() -> Void)?) {
        self.onTapButton = onTapButton
        label.text = title
    }

    private func configureUI() {
        contentView.addSubview(label)

        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12.0),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16.0),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16.0),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12.0)
        ])

        contentView.addSubview(button)

        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 24.0),
            button.widthAnchor.constraint(equalToConstant: 24.0),
            button.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16.0)
        ])
    }
}
