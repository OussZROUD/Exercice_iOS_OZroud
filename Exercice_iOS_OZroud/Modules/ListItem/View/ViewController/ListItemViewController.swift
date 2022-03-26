//
//  ListItemViewController.swift
//  Exercice_iOS_OZroud
//
//  Created by Oussama Zroud on 10/5/20.
//  Copyright © 2020 Oussama Zroud. All rights reserved.
//

import UIKit

class ListItemViewController: UIViewController {
    
    // MARK: - UI
    private let categoryCollectionView: CommonCollectionView = CommonCollectionView(scrollDirection: .horizontal, cell: CategoryCollectionViewCell.self, identifier: Constants.CellID.categoryCell)
    private let productCollectionView: CommonCollectionView = CommonCollectionView(scrollDirection: .vertical, cell: ItemCollectionViewCell.self, identifier: Constants.CellID.productCell)
    
    // MARK: - PROPERTIES
    weak var presenter: ListItemViewToPresenterProtocol?
    private var firstLoad: Bool = false
    private let safeArea = UILayoutGuide()
    
    // MARK: - VIEW CONTROLLER LIFE CYCLE
    override func loadView() {
        super.loadView()
        setupNavigationBar()
        setupSafeArea()
        setupCategoryCollectionView()
        setupProductCollectionView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAllData()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        categoryCollectionView.reloadData()
        productCollectionView.reloadData()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    // MARK: - PRIVATE METHODS
    private func setupNavigationBar() {
        navigationItem.title = Constants.ViewControllerTitle.listItem
        navigationItem.backBarButtonItem = UIBarButtonItem(title: Constants.Buttons.navBarBackButton, style: .plain, target: nil, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(fetchAllData))
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barTintColor = .orange
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
    }
    
    private func setupSafeArea(){
        safeArea.identifier = Constants.ListItem.SafeArea.identifier
        self.view.addLayoutGuide(safeArea)
        safeArea.widthAnchor.constraint(equalTo: view.widthAnchor, constant: Constants.ListItem.SafeArea.widthConstant).isActive = true
        safeArea.heightAnchor.constraint(equalTo: view.heightAnchor, constant: Constants.ListItem.SafeArea.heightConstant).isActive = true
        safeArea.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        safeArea.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
    private func setupCategoryCollectionView(){
        view.addSubview(categoryCollectionView)
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        categoryCollectionView.delaysContentTouches = false
        categoryCollectionView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 65.0).isActive = true
        categoryCollectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 10.0).isActive = true
        categoryCollectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: 0.0).isActive = true
        categoryCollectionView.heightAnchor.constraint(equalToConstant: 75.0).isActive = true
    }
    
    private func setupProductCollectionView(){
        
        view.addSubview(productCollectionView)
        productCollectionView.delegate = self
        productCollectionView.dataSource = self
        productCollectionView.topAnchor.constraint(equalTo: categoryCollectionView.bottomAnchor, constant: 10.0).isActive = true
        productCollectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16.0).isActive = true
        productCollectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16.0).isActive = true
        productCollectionView.heightAnchor.constraint(equalToConstant: view.frame.height - 140.0).isActive = true
    }
    
    private func reloadItemsCollection() {
        DispatchQueue.main.async { [weak self] in
            self?.productCollectionView.reloadData()
            self?.productCollectionView.setContentOffset(CGPoint.zero, animated: true)
            self?.view.stopLoader()
        }
    }
    
    private func reloadCategoriesCollection() {
        DispatchQueue.main.async { [weak self] in
            self?.categoryCollectionView.reloadData()
            if self?.firstLoad ?? false {
                self?.categoryCollectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: true, scrollPosition: .left)
                self?.firstLoad = false
            }
            self?.view.stopLoader()
        }
    }
    
    @objc private func fetchAllData(){
        DispatchQueue.main.async { [weak self] in
            self?.view.startLoader(activityColor: .white, backgroundColor: .lightGray)
        }
        presenter?.fetchListCategory()
        presenter?.fetchListItem()
        firstLoad = true
    }
}

// MARK: - PRESENTER -> VIEW METHODS
extension ListItemViewController: ListItemPresenterToViewProtocol {
    
    func filterListItemSuccessResponse() {
        reloadItemsCollection()
    }
    
    func fetchListItemSuccessResponse() {
        reloadItemsCollection()
    }
    
    func fetchListItemFailureResponse() {
        DispatchQueue.main.async { [weak self] in
            self?.view.stopLoader()
        }
        self.showAlert(title: Constants.Alert.textTitle, message: Constants.Alert.textMessage)
    }
    
    func fetchListCategorySucessResponse() {
        reloadCategoriesCollection()
    }
    
    func fetchListCategoryFailure(error: String) {
        showAlert(title: Constants.Alert.textTitle, message: Constants.Alert.textMessage)
    }
}

// MARK: - COLLECTION DATA SOURCE
extension ListItemViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let count = collectionView == categoryCollectionView ? ( presenter?.categoryNumberOfItemsInSection()) : (presenter?.itemNumberOfItemsInSection())
        return count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
            
        case productCollectionView:
            let cell = productCollectionView.dequeueReusableCell(withReuseIdentifier: Constants.CellID.productCell, for: indexPath) as! ItemCollectionViewCell
            guard let items = presenter?.populateItemsCollection() else { return UICollectionViewCell() }
            cell.populateCell(vm: items[indexPath.item])
            return cell
            
        case categoryCollectionView:
            let cell = categoryCollectionView.dequeueReusableCell(withReuseIdentifier: Constants.CellID.categoryCell, for: indexPath) as! CategoryCollectionViewCell
            guard let categories = presenter?.populateCategoryCollection() else { return UICollectionViewCell() }
            cell.categoryLabel.text = categories[indexPath.item].name
            return cell
            
        default:
            return UICollectionViewCell()
        }
    }
}

//MARK: - COLLECTION DELEGATE
extension ListItemViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == productCollectionView {
            presenter?.navigateToItemDetails(index: indexPath.item)
        } else {
            DispatchQueue.main.async {  [weak self] in
                self?.view.startLoader(activityColor: .white, backgroundColor: .lightGray)
            }
            presenter?.filterListItem(index: indexPath.item)
        }
    }
}

//MARK: - COLLECTION DELEGATE FLOWLAYOUT
extension ListItemViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == productCollectionView {
            
            switch UIDevice.current.userInterfaceIdiom {
                
            case .phone, .unspecified:
                return CGSize(width: collectionView.frame.width, height: (collectionView.frame.width/2) - 20 )
                
            case .pad, .tv, .carPlay, .mac:
                return  UIApplication.shared.statusBarOrientation.isLandscape ? (CGSize(width: (collectionView.frame.width/3) - 7, height: (collectionView.frame.width/6) - 20)) : (CGSize(width: (collectionView.frame.width/2) - 5, height: (collectionView.frame.width/4) - 20 ))
                
            @unknown default:
                return CGSize(width: collectionView.frame.width, height: (collectionView.frame.width/2) - 20 )
            }
        } else {
            switch UIDevice.current.userInterfaceIdiom {
                
            case .phone, .unspecified:
                return CGSize(width: collectionView.frame.width/5, height: 45)
                
            case .pad, .tv, .carPlay, .mac:
                return CGSize(width: collectionView.frame.width/6, height: collectionView.frame.height - 2)
                
            @unknown default:
                return CGSize(width: collectionView.frame.width/5, height: collectionView.frame.height - 2)
            }
        }
    }
}

