//
//  MatchListDataSource.swift
//  Brasileirao
//
//  Created by Alexandre Thadeu  on 14/01/21.
//

import UIKit
import SkeletonView

class MatchListDataSource: BoxDataSource<Match>, SkeletonCollectionViewDataSource {
    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return CollectionViewCellIdentifier.matchListCollectionViewCell
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:  CollectionViewCellIdentifier.matchListCollectionViewCell, for: indexPath) as? MatchCollectionViewCell else { return UICollectionViewCell() }
        
        if !isFirstLoading.value {
            cell.match = self.data.value[indexPath.row]
            cell.hideSkeleton()
        } else {
            cell.showAnimatedGradientSkeleton()
        }
        
        cell.toCard()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.isFirstLoading.value {
            return 5
        }
        
        return self.data.value.count
    }
}
