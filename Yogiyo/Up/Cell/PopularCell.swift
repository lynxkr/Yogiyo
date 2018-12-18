
import UIKit
import Alamofire
import AlamofireImage


class PopularCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    final let url = URL(string: "https://jogiyo.co.kr/restaurants/api/restaurant/?ordering=-review_avg")
    
    lazy var restaurantData: [FoodlistElement] = {
        var restaurants = [FoodlistElement]()
        return restaurants
    }()
    var restList: [FoodlistElement] = []
    
    
    var cellLabel: UILabel!
    
    var images: [String]? {
        didSet {
            collectionView.reloadData()
        }
    }
 
    var titleLabel: [String]? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    let collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 30
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        return cv
        
    }()
    
    let cellId = "cellId"

   
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        downloadJSON()
//        getData()
    }

    func downloadJSON() {
        guard let downloadURL = url else { return }
        URLSession.shared.dataTask(with: downloadURL) { data, urlResponse, error in
            guard let data = data, error == nil, urlResponse != nil else {
                return
            }
            print("Downloaded")
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(Foodlist.self, from: data)
                self.restaurantData = result
                let reviewAverage = result.map { ($0.reviewAvg) }
                let reviewName = result.map { ($0.name) }
                let reviewFloat = reviewAverage.map { ($0 as NSString).floatValue}
                
                //                 print(reviewFloat)
                //                 print(reviewName)
                for i in 1...6 {
                    let rating = reviewAverage
                    let restName = self.restaurantData[i].name
                    print(restName)
//                    print(self.restaurantData[i].name)
//                    print(self.restaurantData[i].reviewAvg)
//                    print(self.restaurantData[i].reviewCount)
                }
            } catch { print("something went wrong ") }
            }.resume()
    }
    
    
    func setup() {
        //ads setup
        var label = UILabel(frame: CGRect(x:0, y:0, width:150,height: 40))
        label.textAlignment = .left
        label.text = "인기맛집!"
        addSubview(label)
        addSubview(collectionView)
        label.setAnchor(top: topAnchor, left: leftAnchor, bottom: collectionView.topAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 30, paddingBottom: 20, paddingRight: 0)
        collectionView.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 50, paddingLeft: 10, paddingBottom: 0, paddingRight: 0)
        
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
        
        var labelName = UILabel(frame: CGRect(x:0, y:14.0, width:100.0, height:30.0))
        labelName.text = images?[indexPath.item]
        cell.contentView.addSubview(labelName)

        if let imageName = images?[indexPath.item] {
            cell.imageView.image = UIImage(named: imageName)
        }
        
        
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
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
        
        let labelName = UILabel()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            setup()
            
        }
        
        func setup() {
            backgroundColor = .blue
            
            addSubview(imageView)
//            addSubview(labelName)
//            labelName.text = "testttt"
            
            imageView.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
            
        }
        
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
    }
    
    
    
}


