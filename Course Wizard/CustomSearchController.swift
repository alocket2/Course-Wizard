//
//  CustomSearchController.swift
//  Course Wizard
//
//  Created by Daniel Marquez on 4/14/16.
//  Copyright © 2016 Anthony Lockett. All rights reserved.
//

import UIKit

protocol CustomSearchControllerDelegate {
    func didStartSearching()
    
    func didTapOnSearchButton()
    
    func didTapOnCancelButton()
    
    func didChangeSearchText(searchText: String)
}

class CustomSearchController: UISearchController, UISearchBarDelegate {
    
    var customSearchBar: CustomSearchBar!
    var customDelegate: CustomSearchControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    init(searchResultsController: UIViewController!, searchBarFrame: CGRect, activeScope: UIColor, inactiveScope: UIColor, searchBarTintColor: UIColor) {
        super.init(searchResultsController: searchResultsController)
        
        configureSearchBar(searchBarFrame, bgColor: searchBarTintColor, actvScope: activeScope, inactvScope: inactiveScope)
    }
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configureSearchBar(frame: CGRect, bgColor: UIColor, actvScope: UIColor, inactvScope: UIColor) {
        customSearchBar = CustomSearchBar(frame: frame, bgColor: bgColor , actvScope: actvScope, inactvScope: inactvScope)
        
        customSearchBar.barTintColor = bgColor
        customSearchBar.activeScopeButtonColor = actvScope
        customSearchBar.inactiveScopeButtonColor = inactvScope
        customSearchBar.showsBookmarkButton = false
        customSearchBar.showsCancelButton = true
        customSearchBar.showsScopeBar = true
        customSearchBar.delegate = self
    }
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        customDelegate.didStartSearching()
    }
    
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        customSearchBar.resignFirstResponder()
        customDelegate.didTapOnSearchButton()
    }
    
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        customSearchBar.resignFirstResponder()
        customDelegate.didTapOnCancelButton()
    }
    
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        customDelegate.didChangeSearchText(searchText)
    }

}
