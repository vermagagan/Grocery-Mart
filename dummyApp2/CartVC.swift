import UIKit
class CartVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    let tableView = UITableView()
    let priceLabel = UILabel()
    let checkOut = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "My Cart"
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .close,
            target: self,
            action: #selector(closeTapped)
        )
        setupUI()
    }

    func setupUI() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        priceLabel.text = "Total: ₹\(CartManager.shared.totalPrice)"
        priceLabel.textColor = AppColors.header
        priceLabel.textAlignment = .center
        priceLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(priceLabel)
        
        checkOut.backgroundColor = AppColors.primary
        checkOut.setTitleColor(.white, for: .normal)
        checkOut.layer.cornerRadius = 8
        checkOut.setTitle("Checkout", for: .normal)
        checkOut.addTarget(self, action: #selector(checkOutTapped), for: .touchUpInside)
        checkOut.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(checkOut)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            
            priceLabel.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 8),
            priceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            checkOut.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 8),
            checkOut.heightAnchor.constraint(equalToConstant: 50),
            checkOut.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            checkOut.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    // MARK: - TableView DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        CartManager.shared.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let product = CartManager.shared.items[indexPath.row]
        cell.textLabel?.text = "\(product.name) — ₹\(product.price)"
        return cell
    }
    
    // MARK: - Swipe to Delete
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Remove") { [weak self] _, _, completion in
            let product = CartManager.shared.items[indexPath.row]
            CartManager.shared.removefromCart(product)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            self?.priceLabel.text = "Total: ₹\(CartManager.shared.totalPrice)"
            completion(true)
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    // MARK: - Actions
    @objc func checkOutTapped() {
        let alert = UIAlertController(title: "Order Placed! 🎉", message: "Your order has been placed successfully.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default) { [weak self] _ in
            CartManager.shared.items.removeAll()
            self?.dismiss(animated: true)
        })
        present(alert, animated: true)
    }
    
    @objc func closeTapped() {
        dismiss(animated: true)
    }
}
