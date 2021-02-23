//
//  MatchDetailsDataSource.swift
//  Brasileirao
//
//  Created by Alexandre Thadeu  on 15/01/21.
//

import Foundation
import UIKit

class MatchDetailsDataSource: BoxDataSource<Action>, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellIdentifier.matchDetailsCollectionViewCell, for: indexPath) as? MatchDetailsCollectionViewCell else { return UICollectionViewCell() }
        
        cell.action = self.data.value[indexPath.row]
        return cell
    }
}
