//
//  CharactersViewController.swift
//  Marvel
//
//  Created by Thiago Lioy on 14/11/16.
//  Copyright © 2016 Thiago Lioy. All rights reserved.
//

import UIKit

final class CharactersViewController: UIViewController {
    
    let service: MarvelService = MarvelServiceMock()
    
    var charactersView: CharactersView! {
        didSet {
            charactersView.setupView()
            view = charactersView
        }
    }
}

extension CharactersViewController {
//    override func loadView() {
//        super.loadView()
//        view = CharactersView(frame: view.bounds)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Characters"
        charactersView = CharactersView(frame: view.bounds)
        setupSearchBar()
        setupNavagationItem()
        fetchCharacters()
    }
}

extension CharactersViewController {
    
    func setupTableView(with items: [Character]) {
        guard let charsView = charactersView else { return }
        charsView.tableViewDataSource = CharacterTableViewDataSource(items: items)
        charsView.tableViewDelegate = CharacterTableViewDelegate(items: items, delegate: self)
    }
    
    func setupCollectionView(with items: [Character]) {
        guard let charsView = charactersView else { return }
        charsView.collectionViewDataSource = CharacterCollectionViewDataSource(items: items)
        charsView.collectionViewDelegate = CharacterCollectionViewDelegate(items: items, delegate: self)
    }
    
    func setupSearchBar() {
        charactersView.searchBarDelegate = self
    }
    
    func setupNavagationItem() {
        let listButton = UIBarButtonItem(image: #imageLiteral(resourceName: "List Icon"), style: .plain, target: self, action: #selector(listButtonTap))
        let gridButton = UIBarButtonItem(image: #imageLiteral(resourceName: "Grid Icon"), style: .plain, target: self, action: #selector(gridButtonTap))
        self.navigationItem.rightBarButtonItems = [listButton, gridButton]
    }
    
    @objc private func listButtonTap() {
        charactersView.presentationState = .list
    }
    
    @objc private func gridButtonTap() {
        charactersView.presentationState = .grid
    }
}

extension CharactersViewController {
    func fetchCharacters(query: String? = nil) {
        charactersView?.loadingState = .loading
        service.fetchCharacters(query: query) { [weak self] result in
            self?.charactersView?.loadingState = .ready
            switch result {
            case .success(let characters):
                self?.handleFetch(of: characters)
            case .error:
                self?.charactersView?.presentationState = .error
            }
        }
    }
    
    func handleFetch(of characters: [Character]) {
        guard let charsView = charactersView else { return }
        charsView.characters = characters
        self.setupTableView(with: characters)
        self.setupCollectionView(with: characters)
        let currentState = charsView.presentationState
        charsView.presentationState = currentState
    }

}

extension CharactersViewController {
//    @IBAction func showAsGrid(_ sender: UIButton) {
//
//    }
//
//    @IBAction func showAsTable(_ sender: UIButton) {
//        charactersView.presentationState = .list
//    }
}


extension CharactersViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        let query = searchBar.text ?? ""
        if !query.isEmpty {
            fetchCharacters(query: query)
        }
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

extension CharactersViewController: CharactersSelectionDelegate {
    func didSelect(character: Character) {
        let controller = CharacterViewController(character: character)
        navigationController?.pushViewController(controller, animated: true)
    }
}

