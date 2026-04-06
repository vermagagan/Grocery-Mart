//
//  DetailViewController.swift
//  dummyApp2
//
//  Created by Gagan Verma on 25/03/26.
//

import UIKit

class DetailViewController: UIViewController {
    var product : Product! = nil
    let titleLabel = UILabel()
    let subTitle = UILabel()
    let SFImage = UIImageView()
    let descriptionLabel = UILabel()
    let AddTocartButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "cart.fill"),
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(cartTapped))
        setupLabels()
        setupSFimage()
        setupStack()
        setupButton()
    }
    
    func setupLabels(){
        titleLabel.text = product.name
        subTitle.text = "₹\(product.price) "+product.unit
        descriptionLabel.text = product.description
        
        titleLabel.textColor = AppColors.header
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        subTitle.textColor = AppColors.subtitle
        subTitle.textAlignment = .center
        subTitle.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        
        
        descriptionLabel.textColor = AppColors.subtitle
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
    }
    func setupSFimage(){
        SFImage.image = UIImage(systemName: product.sfSymbol)
        SFImage.tintColor = AppColors.primary
        SFImage.backgroundColor = .systemBackground
        SFImage.contentMode = .scaleToFill
        SFImage.clipsToBounds = true
        SFImage.translatesAutoresizingMaskIntoConstraints = false
        
    }
    func setupButton(){
        AddTocartButton.setTitle("Add to Cart", for: .normal)
        AddTocartButton.titleLabel?.textColor = AppColors.header
        AddTocartButton.layer.cornerRadius = 8
        AddTocartButton.backgroundColor = AppColors.primary
        AddTocartButton.addTarget(self, action: #selector(addTapped), for: .touchUpInside)
        AddTocartButton.translatesAutoresizingMaskIntoConstraints = false
    }
    func setupStack(){
        let stack = UIStackView(arrangedSubviews: [
            SFImage,
            titleLabel,
            subTitle,
            descriptionLabel,
            AddTocartButton
        ])
        
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stack)
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            
            SFImage.heightAnchor.constraint(equalToConstant: 360),
            SFImage.widthAnchor.constraint(equalToConstant: 360),
            
            AddTocartButton.heightAnchor.constraint(equalToConstant: 40),
            AddTocartButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8)
            
            
        ])
    }
    
    @objc func addTapped(){
        CartManager.shared.addtoCart(product)
        let alert = UIAlertController(title: "Alert!", message: "\(product.name) added to cart", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Done", style: .default)
        alert.addAction(okAction)
        self.present(alert, animated: true)
    }

    @objc func cartTapped(){
        presentCart()
    }

}
