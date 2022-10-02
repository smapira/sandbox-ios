//
//  ViewController.swift
//  sandbox-ios
//
//  Created by bookair18 on 2022/09/27.
//

import UIKit

class ViewController: UICollectionViewController {

  var collectitonItems = [CollectionItem]()

  //	Guard Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: 'UICollectionView must be initialized with a non-nil layout parameter'
  init() {
    super.init(collectionViewLayout: UICollectionViewFlowLayout())
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView?.backgroundColor = UIColor.white
    self.collectionView!.register(
      CollectionCell.self,
      forCellWithReuseIdentifier: CollectionCell.reuseIdentifier)
    collectitonItems.append(CollectionItem.init(name: "test"))
    self.collectionView?.reloadData()
  }

  //MARK: - UICollectionViewDataSource

  override func collectionView(
    _ collectionView: UICollectionView,
    numberOfItemsInSection section: Int
  ) -> Int {
    return collectitonItems.count
  }

  override func collectionView(
    _ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath
  ) -> UICollectionViewCell {
    let cell =
      collectionView
      .dequeueReusableCell(
        withReuseIdentifier: CollectionCell.reuseIdentifier,
        for: indexPath) as! CollectionCell
    cell.collectionItem = self.collectitonItems[indexPath.item]
    return cell
  }

}
