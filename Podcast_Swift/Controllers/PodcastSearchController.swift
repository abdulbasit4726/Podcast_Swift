//
//  PodcastSearchController.swift
//  Podcast_Swift
//
//  Created by Abdul Basit on 18/05/2025.
//


import UIKit
import Alamofire

class PodcastSearchController: UITableViewController, UISearchBarDelegate {

    var podcasts = [Podcast]()

    let cellId = "cellId"

    let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
        tableView.register(UINib(nibName: "PodcastCell", bundle: nil), forCellReuseIdentifier: cellId)
    }

    // MARK: - UISearchBar
    fileprivate func setupNavigationBar() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        APIService.shared.fetchPodcasts(searchText: searchText) { podcasts in
            self.podcasts = podcasts
            self.tableView.reloadData()
        }
    }

    // MARK: - UITableView
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard podcasts.isEmpty else {return nil}
        let label = UILabel()
        label.text = "Please enter a Search Term"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return label
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return podcasts.isEmpty ? 250 : 0
    }

    override func tableView(
        _ tableView: UITableView, numberOfRowsInSection section: Int
    ) -> Int {
        return podcasts.count
    }

    override func tableView(
        _ tableView: UITableView, cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: cellId, for: indexPath) as! PodcastCell
        cell.podcast = self.podcasts[indexPath.row]
        return cell
    }
    override func tableView(
        _ tableView: UITableView, heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        return 132
    }
}
