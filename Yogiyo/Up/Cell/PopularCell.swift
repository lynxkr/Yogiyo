

import UIKit
import Alamofire
import AlamofireImage
import Foundation


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
        //        downloadJSON()
        testJSON()
        //        getData()
    }
    
    
    func testJSON() {
        guard let url = URL(string: "https://jogiyo.co.kr/restaurants/api/restaurant/?ordering=-review_avg") else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataResponse = data,
                error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return }
            do{
                
                let jsonResponse = try JSONSerialization.jsonObject(with: dataResponse, options: [])
                
                guard let jsonArray = jsonResponse as? [[String: Any]] else {
                    return
                }
                
                for dic in jsonArray{
                    guard let name = dic["name"] as? String else { return }
                    print(name)
                }
                
                
                let decoder = JSONDecoder()
                let result = try decoder.decode(Foodlist.self, from:
                    dataResponse)
                self.restaurantData = result
                let arraySlice = self.restaurantData[..<4]
                //            let restList = Array(arraySlice)
                self.restList = Array(arraySlice)
                print(self.restList.count)
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
                
            } catch let parsingError {
                print("Error here", parsingError)
            }
        }
        task.resume()
        
        
    }
    
    
    
    func setup() {
        let label = UILabel(frame: CGRect(x:0, y:0, width:150,height: 50))
        label.font = UIFont.boldSystemFont(ofSize: 24.0)
        
        label.textAlignment = .left
        label.addTextWithImageLarge(text: "인기맛집!", image: UIImage(named: "yogiyo")!, imageBehindText: false, keepPreviousText: true)
        addSubview(label)
        addSubview(collectionView)
        label.setAnchor(top: topAnchor, left: leftAnchor, bottom: collectionView.topAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 30, paddingBottom: 10, paddingRight: 0)
        collectionView.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 50, paddingLeft: 10, paddingBottom: 0, paddingRight: 0)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(IconsCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.showsHorizontalScrollIndicator = false
        
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return restList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! IconsCell
        
        let url = restList[indexPath.row].logoURL ?? ""
        Alamofire.request(url).responseImage { response in
            switch response.result {
            case .success(_): if let image = response.result.value {
                let img = image
                
                cell.imageView.image = img
                cell.imageView.clipsToBounds = true
                cell.imageView.contentMode = .scaleAspectFit
                
                }
            case .failure(let err) : print("에러: \(err)")
            }
  
            
        }
        
        let labelName = UILabel(frame: CGRect(x:10, y:14.0, width:150, height:30.0))
        labelName.text = restList[indexPath.row].name
        labelName.font = UIFont.boldSystemFont(ofSize: 14.0)
        
       let rating = UILabel(frame: CGRect(x:10, y:40.0, width:150, height:30.0))
        rating.font = UIFont.boldSystemFont(ofSize: 12.0)
        rating.textColor = UIColor(red: 255/255, green: 154/255, blue: 2/255, alpha: 1.0)
        rating.addTextWithImage(text: String(format: "%.1f", restList[indexPath.row].reviewAvg ?? 5), image: UIImage(named: "rating")!, imageBehindText: false, keepPreviousText: true)
        
        
        let review = UILabel(frame: CGRect(x:60, y:40.0, width:150, height:30.0))
        review.font = UIFont.boldSystemFont(ofSize: 12.0)
        review.textColor = UIColor(red: 91/255, green: 91/255, blue: 91/255, alpha: 1.0)
        review.text = "리뷰  " + String(format: "%.1f", restList[indexPath.row].reviewAvg ?? 5)
        
        
        
        

        cell.imageView.addSubview(labelName)
        cell.imageView.addSubview(rating)
        cell.imageView.addSubview(review)

        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        print(restList[indexPath.row])
        
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
        
        var rating = UILabel()

        
        override init(frame: CGRect) {
            super.init(frame: frame)
            setup()
            
        }
        
        func setup() {
            addSubview(imageView)
            imageView.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
            
            imageView.addSubview(rating)
            rating.setAnchor(top: imageView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        }
        
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
    }
    
    
    
}
