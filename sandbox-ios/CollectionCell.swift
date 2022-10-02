import UIKit

class CollectionCell: UICollectionViewCell {

  static let reuseIdentifier = String(describing: CollectionCell.self)

  var collectionItem: CollectionItem? {
    didSet {
      if let collectionItem = collectionItem {
        nameLabel.text = collectionItem.name
      }
    }
  }

  private let nameLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.boldSystemFont(ofSize: 15)
    label.numberOfLines = 0
    label.sizeToFit()
    label.lineBreakMode = .byWordWrapping
    return label
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    sharedInit()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    sharedInit()
  }

  private func sharedInit() {
    contentView.backgroundColor = .red
    addSubview(nameLabel)
  }
}
