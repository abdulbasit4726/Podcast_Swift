//
//  PodcastSearchController.swift
//  Podcast_Swift
//
//  Created by Abdul Basit on 18/05/2025.
//


import UIKit
import Alamofire

class PodcastSearchController: UITableViewController, UISearchBarDelegate {

    var podcasts = [
        Podcast(trackName: "Lets Build That App", artistName: "Brian Voong"),
        Podcast(trackName: "Some Podcast", artistName: "ArtistName"),
        Podcast(trackName: "Lets Build That App", artistName: "Brian Voong"),
    ]

    let cellId = "cellId"

    let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
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

    override func tableView(
        _ tableView: UITableView, numberOfRowsInSection section: Int
    ) -> Int {
        return podcasts.count
    }

    override func tableView(
        _ tableView: UITableView, cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: cellId, for: indexPath)
        let podcast = self.podcasts[indexPath.row]
        cell.textLabel?.text = "\(podcast.trackName ?? "")\n\(podcast.artistName ?? "")"
        cell.textLabel?.numberOfLines = 0
        cell.imageView?.image = UIImage(named: "appicon")
        return cell
    }
    override func tableView(
        _ tableView: UITableView, heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        return 80
    }
}
