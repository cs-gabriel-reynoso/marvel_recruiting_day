//
//  CharactersView.swift
//  
//
//  Created by gabriel.n.reynoso on 16/01/19.
//

import UIKit

class CharactersView: UIView {
    
    private var searchBar: UISearchBar = UISearchBar(frame: .zero)
    private var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView(frame: .zero)
    private var tableView: UITableView = UITableView(frame: .zero)
    private var collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    var characters: [Character] = []
    
    var tableViewDataSource: CharacterTableViewDataSource? {
        didSet {
            tableView.dataSource = tableViewDataSource
        }
    }
    var tableViewDelegate: CharacterTableViewDelegate? {
        didSet {
            tableView.delegate = tableViewDelegate
        }
    }
    var collectionViewDataSource: CharacterCollectionViewDataSource? {
        didSet {
            collectionView.dataSource = collectionViewDataSource
        }
    }
    var collectionViewDelegate: CharacterCollectionViewDelegate? {
        didSet {
            collectionView.delegate = collectionViewDelegate
        }
    }
    var searchBarDelegate:UISearchBarDelegate? {
        didSet {
            searchBar.delegate = searchBarDelegate
        }
    }
    
    enum LoadingState {
        case loading
        case ready
    }
    
    enum PresentationState {
        case initial
        case list
        case grid
        case error
    }
    
    var loadingState: LoadingState = .ready {
        didSet {
            refreshLoading(state: loadingState)
        }
    }
    
    var presentationState: PresentationState = .list {
        didSet {
            refreshUI(for: presentationState)
        }
    }
}

extension CharactersView: ViewCodeBased {
    
    func setupComponents() {
//        searchBar = UISearchBar(frame: .zero)
//        activityIndicator = UIActivityIndicatorView(frame: .zero)
//        tableView = UITableView(frame: .zero)
//        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        addSubview(tableView)
        addSubview(collectionView)
        addSubview(activityIndicator)
        addSubview(searchBar)
    }
    
    func setupAutolayout() {
        searchBar.attachToSafeAreaLeftRightAnchors()
        searchBar.topAnchor.constraint(equalTo: topAnchor).isActive = true
        
        activityIndicator.attachToSafeAreaCenterYXAnchors()
        
        tableView.attachToSafeAreaLeftRightAnchors()
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor).isActive = true
        
        collectionView.attachToSafeAreaLeftRightAnchors()
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor).isActive = true
    }
    
    func setupAdditional() {
        backgroundColor = ColorPalette.white
    }
}

extension CharactersView {
    
    private func refreshLoading(state: LoadingState) {
        switch state {
        case .loading:
            activityIndicator.startAnimating()
        case .ready:
            activityIndicator.stopAnimating()
        }
    }
    
    private func refreshUI(for presentationState: PresentationState) {
        switch presentationState {
        case .list:
            tableView.isHidden = false
            collectionView.isHidden = true
        case .grid:
            tableView.isHidden = true
            collectionView.isHidden = false
        case .error, .initial:
            tableView.isHidden = true
            collectionView.isHidden = true
        }
    }
}
