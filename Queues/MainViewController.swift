//
//  ViewController.swift
//  Queues


import UIKit

class MainViewController: UICollectionViewController {
  
  let solarImageUrls =   ["https://naked-science.ru/wp-content/uploads/2016/12/field_image_07.jpg",
                      "https://potokmedia.ru/wp-content/uploads/2021/01/scale_1200-7.jpg",
                      "http://4put.ru/pictures/max/46/144099.jpg",
                      "https://ae01.alicdn.com/kf/HLB1jOUUbjnuK1RkSmFPq6AuzFXa5/9.jpg_q50.jpg",
                      "https://wpcluster.dctdigital.com/sundaypost/wp-content/uploads/sites/13/2016/03/Planets-of-the-Solar-system.jpg",
                      "https://wallpaperaccess.com/full/455618.jpg",
                      "https://img5.goodfon.com/wallpaper/nbig/6/71/solntse-planety-solnechnaia-sistema-masshtab.jpg",
                      "https://wallpapersplanet.net/sites/default/files/solar-system-wallpapers-37485-9588365.png",
                      "https://wallpaperaccess.com/full/3289171.jpg"]
  

  override func viewDidLoad() {
    super.viewDidLoad()
  }


}

extension MainViewController {
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return solarImageUrls.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ImageCollectionViewCell
    let url = URL(string: solarImageUrls[indexPath.row])
   
    DispatchQueue.global().async {
        guard let data = try? Data(contentsOf: url!) else {return}
        DispatchQueue.main.async {
            cell.imageCell.image = UIImage(data: data)
        }
    }
    return cell
  }
}
