//
//  myLocationViewController.swift
//  carrotProject
//
//  Created by 이진하 on 2021/07/09.
//

import UIKit

class myLocationViewController: UIViewController {
    
    
    //MARK: - properites
    
    let screenSize: CGRect = UIScreen.main.bounds
    
    let keywords:[String] = ["안경" , "디저트" , "부동산" , "전기" , "필라테스" , "미용실","헬스","강아지","치킨","피아노","왁싱","요가"]
    
    let menu:[Menu] = [
            Menu(image: "coupon", name: "쿠폰북"),
            Menu(image: "map", name: "친환경 지도"),
            Menu(image: "house", name: "부동산 직거래"),
            Menu(image: "cafe", name: "카페"),
            Menu(image: "parttime", name: "동네알바"),
            Menu(image: "job", name: "동네 구인구직"),
            Menu(image: "class", name: "과외/클래스"),
            Menu(image: "apple", name: "농수산물"),
            Menu(image: "gethouse", name: "분양"),
            Menu(image: "car", name: "중고차"),
            Menu(image: "clean", name: "청소"),
            Menu(image: "laundry", name: "세탁"),
            Menu(image: "pet", name: "반려동물"),
            Menu(image: "carrot", name: "당근 장바구니"),
            Menu(image: "advertise", name: "지역광고")
        ]
    
    let news:[News] = [
        News(contentImg: "ad1", title: "영희네 닭갈비 복날 특별 이벤트 진행중^^", content: "더우시죠? 복날을 맞아 영희네가 시원하게 수박쥬스 쏩니다^^ 초복,중복,말복 전날, 당일, 다음날 주문해 주신 모든 고객님께 직접 만든 100% 리얼 수박쥬스를 제공합니다~", profileImg: "profile2", nickName: "영희네 닭갈비", townName: "삼성동", couponExist: false),
        News(contentImg: "ad2", title: "평일 저녁 7시~9시 매장내 음료 2000원 할인 이벤트 합니다:)", content: "밀크티 제외한 나머지 모든 음료 2000원 할인 이벤트 진행합니다! 평일 저녁 7시~9시에 사용 가능합니다 :)", profileImg: "profile1", nickName: "홍차가게청담", townName: "삼성동", couponExist: true),
        News(contentImg: "ad3", title: "소형원룸이사 화물운송 용달 학생이사", content: "소형원룸 고시원 이사와 당근마켓 중고거래 라보차량 우체국 5호박스 25개 상차가능 원룸풀옵 충분합니다 01011123334", profileImg: "profile3", nickName: "이사 화물 운송", townName: "역삼동", couponExist: false)
        ]
    
    let recommends:[Recommend] = [
        Recommend(photo1: "recommend1", photo2: "recommend2", storeName: "휴대폰성지 강남", content: "🥕🥕🥕🥕당근마켓 강남 1등매장 🥕🥕🥕 타매장과 비교불가 독보적 1위!!!", reviewNum: 236, customNum: 420, customer: "크스므", review: "0. 구매모델 갤럭시 노트 20 울트라 블랙 2.가격 다른곳보다 싸게 해주셨어요"),
        Recommend(photo1: "recommend3", photo2: "recommend4", storeName: "예손", content: "여기저기 쑤시거나 결린 고객님의 통증으로인한 불편한 몸을 20년의 경력 노하우로 시원하고 편하게 지친 몸을 행복하게 업그레이드시켜 드리겠습니다", reviewNum: 77, customNum: 472, customer: "해피나눔", review: "저렴한곳도 가보고 비싼곳도 가보고 그랬었는데 마사지는 확실히 기술이중요한것 같아요"),
        Recommend(photo1: "recommend5", photo2: "recommend8", storeName: "오늘수거", content: "무엇이든, 문 앞에 두고 수거 요청하면 끝. 수거했어, 오늘도", reviewNum: 4, customNum: 114, customer: "세상에이런일이", review: "이거 쓰지마세요 전으로 못돌아가요 미쳤어요 이제 없으면 못살아요 ㅠ 서비스 초기이신 것 같은데 열심히 하셔서 꼭 계속 해주세요..."),
        Recommend(photo1: "recommend6", photo2: "recommend7", storeName: "트럭링스", content: "믿을 수 있는 운송업체 트럭링스 :) 홈페이지 회원 가입시 기본 3천원 쿠폰과 최대 2만원 까지 추가 할인!", reviewNum: 79, customNum: 191, customer: "토끼한", review: "정말 너무 만족스러워서 강추합니다!!!! 아래 후기보고 혹신 불친절한 아저씨 오시면 어쩌나 걱정했는데, 정말 그런 걱정 왜 했나 싶을 정도로 만족스럽습니다!!!")
    ]
    
    let scrollViewHeight:CGFloat = 1440
    let contentView: UIView = UIView()
    
    let searchContainerView: UIView = UIView()
    
    lazy var searchButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .textFieldBlue
        
        button.layer.cornerRadius = 8
        button.setImage(UIImage(named: "searchIcon"), for: .normal)
        button.contentHorizontalAlignment = .left
        let attributedTitle = NSAttributedString(string: "역삼2동 주변 가게를 찾아보세요", attributes: [.foregroundColor: UIColor.systemGray, .font: UIFont.systemFont(ofSize: 16)])
        button.setAttributedTitle(attributedTitle, for: .normal)
        return button
    }()
    
    let bottomContainerView = UIView()
    
    lazy var keywordCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 5
        let collectionView = UICollectionView(frame:
                                                CGRect.zero
                                              , collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "keywordCell", bundle: nil), forCellWithReuseIdentifier: "keyword")
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .white
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
        return collectionView
    }()
       
    lazy var menuCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame:
                                                CGRect.zero
                                              , collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "menuCell", bundle: nil), forCellWithReuseIdentifier: "menu")
        collectionView.backgroundColor = .white
        collectionView.contentInset = UIEdgeInsets(top: 15, left: 10, bottom: 5, right: 10)
        
        return collectionView
    }()
    
    let nearbyLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .heavy)
        label.text = "내 근처 소식"
        label.textColor = .black
        return label
    }()
    
    lazy var nearbyTableview: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "nearbyCell", bundle: nil), forCellReuseIdentifier: "nearby")
        tableView.backgroundColor = .white
        tableView.isScrollEnabled = false
        tableView.separatorInset = .init(top: 20, left: 7, bottom: 0, right: 7)
        return tableView
    }()
    
    lazy var nearbyDetailButton:UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 6
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.textFieldBlue.cgColor
        button.setTitle("내 근처 소식 전체보기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 13)
        button.setImage(UIImage(named: "next"), for: .normal)
        button.semanticContentAttribute = .forceRightToLeft
        return button
    }()
    
    let recommendLabel:UILabel = {
        let label = UILabel()
        label.text = "이웃들의 추천 가게"
        label.font = .systemFont(ofSize: 20, weight: .heavy)
        label.textColor = .black
        return label
    }()
    
    lazy var recommendCollectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 5
        let collectionView = UICollectionView(frame:
                                                CGRect.zero
                                              , collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "recommendCell", bundle: nil), forCellWithReuseIdentifier: "recommend")
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .white
        collectionView.contentInset = UIEdgeInsets(top: -20, left: 15, bottom: 0, right: 15)
        return collectionView
    }()
    
    lazy var businessView:UIView = {
        let view = UIView()
        view.backgroundColor = .businessBlue
        view.layer.cornerRadius = 8
        return view
    }()
    
    lazy var businessLabel :UILabel = {
       let label = UILabel()
        label.text = "사장님이신가요? 단골을 모아보세요!"
        label.font = .systemFont(ofSize: 18, weight: .heavy)
        label.textColor = .businessDarkBlue
        return label
    }()
    
    lazy var businessProfileButton : UIButton = {
        let button = UIButton()
        button.setTitle("비즈프로필 만들기", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14)
        button.setTitleColor(.black, for: .normal)
        button.setImage(UIImage(named: "next"), for: .normal)
        button.semanticContentAttribute = .forceRightToLeft
        button.contentHorizontalAlignment = .left
        return button
    }()
    
    //MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .textFieldBlue
        setNavLayout()
        setScrollViewLayout()
        setSearchButtonLayout()
        setKeywordCollectionViewLayout()
        setMenuCollectionViewLayout()
        setNearbyTableViewLayout()
        recommendLayout()
        setBusinessLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
}
