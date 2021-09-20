//
//  AppsSearchController.swift
//  AppStore
//
//  Created by muslim on 18.09.2021.
//

import UIKit
import SDWebImage

class AppsSearchController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    fileprivate var appResult = [Result]()
    
    fileprivate let cellId = "id1234"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: cellId)
        
        fetchITunesApps()
        
    }
    
    
    fileprivate func fetchITunesApps() {
        
        Service.shared.fetchApps { (results, err) in
            
            if let err = err {
                print("Failed to fetch apps", err)
            }
            
            self.appResult = results
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 350)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        appResult.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchResultCell
        cell.appResult = appResult[indexPath.item]
        return cell
        
    }

    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
