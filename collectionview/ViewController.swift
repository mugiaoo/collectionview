//
//  ViewController.swift
//  collectionview
//
//  Created by Mugi on 2022/05/23.
//

import UIKit
import SwiftyJSON
import Alamofire

//private var castItems:[Sweets] = [Sweets]()
// 
//func fechData(){
//    castItems.removerAll()
//    URLSession.shared.dataTask(with: "http://hakodate.gq/sweets.json")!, completionHandler)
//}


class ViewController: UIViewController{
  
//    let titleLabels: [String] = ["title1", "title2", "title3", "title4"]
    
    var sweets = [Sweets]()
    
    override func viewDidLoad(){
        super.viewDidLoad()
    
        
        
        Alamofire.request("http://sweetsapi.c.fun.ac.jp/sweets", method: .get, encoding:
                            JSONEncoding.default).responseJSON {
                response in
            //print(response)
            if let data = response.data{
                print(String(data: data, encoding: .utf8)!)
            }
            switch response.result {

            case .success:
                guard let data = response.data else{
                return
            }
                guard let UserModel = try? JSONDecoder().decode([Sweets].self, from: data) else {
               //print("Error!")
                return
            }
                
                
            case .failure(let error):
                           print(error)

                }
        }

    }
//        Alamofire.request("http://hakodate.gq/sweets.json").response { response in
//            if let data = response.data {
//                let result = try? JSONDecoder().decode(UserModel.self, from: data)
//                print(result)
//            }
//       // }
}




extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    //セクション数
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //セル数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return titleLabels.count
        return 10
    }
    
    //セルに値をセット
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = .blue
        
//    // セルのラベルに値をセット。viewWithTagにはタグの番号を指定
//        let title = cell.contentView.viewWithTag(1) as! UILabel
//        title.text = titleLabels[indexPath.row]
        
    // セルに枠線をセット
            cell.layer.borderColor = UIColor.lightGray.cgColor // 外枠の色
            cell.layer.borderWidth = 1.0 // 枠線の太さ
        
        return cell
    }
}

// セルのサイズを調整する
extension ViewController: UICollectionViewDelegateFlowLayout {

    // セルサイズを指定する
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        // 横方向のサイズを調整
        let cellSizeWidth:CGFloat = self.view.frame.width/2 - 30
    
        // widthとheightのサイズを返す
        return CGSize(width: cellSizeWidth, height: cellSizeWidth/3)
    }
    
    //セルの行間
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
         return 15.0 // 行間
    }
    
    //セルの余白
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
      return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }




}
