
import UIKit
import Alamofire
import AlamofireImage


class PopularCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    lazy var reviewData: Review = {
        var review = [ReviewElement]()
        return review
    }()
    lazy var menuData: [MenuElement] = {
        var menu = [MenuElement]()
        return menu
    }()
    
    
    var images: [String]? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    let collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 20
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        return cv
        
    }()
    
    let cellId = "cellId"
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
//        getData()
    }

    func setup() {
        //ads setup
        addSubview(collectionView)
        collectionView.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 0)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(IconsCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.showsHorizontalScrollIndicator = false
        
    }
    
  
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! IconsCell
        if let imageName = images?[indexPath.item] {
            cell.imageView.image = UIImage(named: imageName)

        }
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        print("test")
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private class IconsCell: UICollectionViewCell {
        
        let imageView: UIImageView = {
            let iv = UIImageView()
            iv.contentMode = .scaleAspectFit
            iv.clipsToBounds = true
            return iv
        }()
        
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            setup()
            
        }
        
        func setup() {
            backgroundColor = .blue
            addSubview(imageView)

            var popularLabel = UILabel(frame: CGRect(x:0, y:0, width:200, height:21))
            popularLabel.text = "Popular"
            imageView.addSubview(popularLabel)
            popularLabel.setAnchor(top: topAnchor, left: leftAnchor, bottom: imageView.bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
            imageView.setAnchor(top: popularLabel.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
            
            self.addSubview(popularLabel)
            
            
        }
        
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
    }
    
    
    
}


