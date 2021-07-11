//
//  myLocaionViewController+Extension.swift
//  carrotProject
//
//  Created by 이진하 on 2021/07/10.
//

import UIKit


//MARK: - CollectionView Extensions

extension myLocationViewController : UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == keywordCollectionView {
            return keywords.count
            
        }else if collectionView == menuCollectionView {
            return menu.count
        }else if collectionView == recommendCollectionView {
            return recommends.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == keywordCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "keyword", for: indexPath) as? keywordCell else { return UICollectionViewCell() }
            cell.keyword.text = keywords[indexPath.item]
            return cell
            
        }else if collectionView == menuCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menu", for: indexPath) as? menuCell else { return UICollectionViewCell() }
            let menuItem = self.menu[ indexPath.item ]
            cell.icon.image = UIImage(named: menuItem.image)
            cell.menuName.text = menuItem.name
            return cell
            
        }else if collectionView == recommendCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "recommend", for: indexPath) as? recommendCell else { return UICollectionViewCell() }
            let recommend = recommends[indexPath.item]
            cell.recommend = recommend
            return cell
        }
        
        return UICollectionViewCell()
    }
}

extension myLocationViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //keywords
        if collectionView == keywordCollectionView {
            let label = UILabel()
            label.text = keywords[indexPath.item]
            label.font = .boldSystemFont(ofSize: 15)
            label.sizeToFit()
            return CGSize(width: label.frame.width + 20, height: label.frame.height + 16)
            
        //menu
        } else if collectionView == menuCollectionView {
            return CGSize(width: screenSize.width / 4 - 8 , height: screenSize.width / 4 - 18)
            
        }else if collectionView == recommendCollectionView {
            return CGSize(width: 302, height: 235)
        }
        return CGSize.zero
    }
}


//MARK: - TableView Extensions

extension myLocationViewController: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = nearbyTableview.dequeueReusableCell(withIdentifier: "nearby", for: indexPath) as? nearbyCell else { return UITableViewCell() }
        cell.news = news[indexPath.row]
        return cell
    }
}
