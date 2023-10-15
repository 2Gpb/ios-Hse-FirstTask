//
//  AddViewController.swift
//  TableViewHW
//
//  Created by Peter on 15.10.2023.
//

import UIKit

protocol AddViewControllerDelegate: AnyObject {
    func update(name: String, protein: String, fats: String, carbs: String, Kcal: String)
}

class AddViewController: UIViewController{
    
    var delegate: AddViewControllerDelegate?
    
    //MARK: SubViews
    
    private lazy var NameTextField: UITextField = {
        let text = UITextField()
        text.placeholder = "Name"
        
        let color: UIColor = .systemGreen
        let cornerRadius: CGFloat = 16
        let width: CGFloat = 1
        
        text.layer.borderWidth = width
        text.layer.borderColor = color.cgColor
        text.layer.cornerRadius = cornerRadius
        
        let paddingView = UIView(frame: CGRectMake(0, 0, 20, text.frame.height))
        text.leftView = paddingView
        text.leftViewMode = UITextField.ViewMode.always
        
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private lazy var ProteinTextField: UITextField = {
        let text = UITextField()
        text.placeholder = "Protein (per 100 gr.)"
        
        let color: UIColor = .systemGreen
        let cornerRadius: CGFloat = 16
        let width: CGFloat = 1
        
        text.layer.borderWidth = width
        text.layer.borderColor = color.cgColor
        text.layer.cornerRadius = cornerRadius
        
        let paddingView = UIView(frame: CGRectMake(0, 0, 20, text.frame.height))
        text.leftView = paddingView
        text.leftViewMode = UITextField.ViewMode.always
        
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private lazy var FatsTextField: UITextField = {
        let text = UITextField()
        text.placeholder = "Fats (per 100 gr.)"
        
        let color: UIColor = .systemGreen
        let cornerRadius: CGFloat = 16
        let width: CGFloat = 1
        
        text.layer.borderWidth = width
        text.layer.borderColor = color.cgColor
        text.layer.cornerRadius = cornerRadius
        
        let paddingView = UIView(frame: CGRectMake(0, 0, 20, text.frame.height))
        text.leftView = paddingView
        text.leftViewMode = UITextField.ViewMode.always
        
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private lazy var CarbsTextField: UITextField = {
        let text = UITextField()
        text.placeholder = "Carbs (per 100 gr.)"
        
        let color: UIColor = .systemGreen
        let cornerRadius: CGFloat = 16
        let width: CGFloat = 1
        
        text.layer.borderWidth = width
        text.layer.borderColor = color.cgColor
        text.layer.cornerRadius = cornerRadius
        
        let paddingView = UIView(frame: CGRectMake(0, 0, 20, text.frame.height))
        text.leftView = paddingView
        text.leftViewMode = UITextField.ViewMode.always
        
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private lazy var KcalTextField: UITextField = {
        let text = UITextField()
        text.placeholder = "Kcals (per 100 gr.)"
        
        let color: UIColor = .systemGreen
        let cornerRadius: CGFloat = 16
        let width: CGFloat = 1
        
        text.layer.borderWidth = width
        text.layer.borderColor = color.cgColor
        text.layer.cornerRadius = cornerRadius
        
        let paddingView = UIView(frame: CGRectMake(0, 0, 20, text.frame.height))
        text.leftView = paddingView
        text.leftViewMode = UITextField.ViewMode.always
        
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private lazy var doneButton: UIButton = {
        let button = UIButton()
        button.setTitle("Done", for: .normal)
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 16.0
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addAction(UIAction {[weak self] _ in
            guard let self else { return }
            
            if let name = NameTextField.text,
            let protein = ProteinTextField.text,
            let fats = FatsTextField.text,
            let carbs = CarbsTextField.text,
            let kcals = KcalTextField.text {
            
                self.delegate?.update(name: name, protein: protein, fats: fats, carbs: carbs, Kcal: kcals)
                self.navigationController?.popViewController(animated: true)
                
            }
        }, for: .touchUpInside)
        return button
    }()
    
    //MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        self.navigationController?.isNavigationBarHidden = false
    }
    
    //MARK: Methods
    
    func configureUI() {
        
        view.backgroundColor = .white
        
        view.addSubview(NameTextField)
        
        NSLayoutConstraint.activate([
            NameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            NameTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20.0),
            NameTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20.0),
            NameTextField.heightAnchor.constraint(equalToConstant: 44.0)
        ])
        
        view.addSubview(ProteinTextField)
        
        NSLayoutConstraint.activate([
            ProteinTextField.topAnchor.constraint(equalTo: NameTextField.bottomAnchor, constant: 10.0),
            ProteinTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20.0),
            ProteinTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20.0),
            ProteinTextField.heightAnchor.constraint(equalToConstant: 44.0)
        ])
        
        view.addSubview(FatsTextField)
        
        NSLayoutConstraint.activate([
            FatsTextField.topAnchor.constraint(equalTo: ProteinTextField.bottomAnchor, constant: 10.0),
            FatsTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20.0),
            FatsTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20.0),
            FatsTextField.heightAnchor.constraint(equalToConstant: 44.0)
        ])
        
        view.addSubview(CarbsTextField)
        
        NSLayoutConstraint.activate([
            CarbsTextField.topAnchor.constraint(equalTo: FatsTextField.bottomAnchor, constant: 10.0),
            CarbsTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20.0),
            CarbsTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20.0),
            CarbsTextField.heightAnchor.constraint(equalToConstant: 44.0)
        ])
        
        view.addSubview(KcalTextField)
        
        NSLayoutConstraint.activate([
            KcalTextField.topAnchor.constraint(equalTo: CarbsTextField.bottomAnchor, constant: 10.0),
            KcalTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20.0),
            KcalTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20.0),
            KcalTextField.heightAnchor.constraint(equalToConstant: 44.0)
        ])
        
        view.addSubview(doneButton)
        
        NSLayoutConstraint.activate([
            doneButton.topAnchor.constraint(equalTo: KcalTextField.bottomAnchor, constant: 20.0),
            doneButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20.0),
            doneButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            doneButton.heightAnchor.constraint(equalToConstant: 44.0)
        ])
        
    }

}
