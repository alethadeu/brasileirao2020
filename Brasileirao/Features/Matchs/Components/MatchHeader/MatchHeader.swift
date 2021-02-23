//
//  MatchHeader.swift
//  Brasileirao
//
//  Created by Alexandre Thadeu  on 15/01/21.
//

import UIKit
import SnapKit

class MatchHeader: UIView {
    
    var match: Match? {
        didSet {
            guard let match = self.match else {
                return
            }
            configHomeValues(team: match.homeTeam)
            configAwayValues(team: match.awayTeam)
            configMatchResult(result: match.matchResult)
            configLocation(location: match.location)
            configDate(match: match)
        }
    }
    
    lazy var labelDateDay: UILabel = { return Theme.Label().secondaryLabel }()
    
    lazy var labelStadium: UILabel = { return Theme.Label().titleLabel }()
    
    lazy var labelDateHour: UILabel = { return Theme.Label().secondaryLabel }()
    
    lazy var labelHomeName: UILabel = { return Theme.Label().primaryLabel }()
    
    lazy var labelAwayName: UILabel = { return Theme.Label().primaryLabel }()
    
    lazy var labelHomeScore: UILabel = { return Theme.Label().higlightLabel }()
    
    lazy var labelAwayScore: UILabel = { return Theme.Label().higlightLabel }()
    
    lazy var imageViewHomeCrest: UIImageView = { return Theme.ImageView().crestImageView }()
    
    var imageViewAwayCrest: UIImageView = { return Theme.ImageView().crestImageView }()
    
    lazy var imageViewDivison: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "multiply")
        imageView.tintColor = .quaternaryLabel
        return imageView
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        layoutViews()
        self.backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    //Layout
    func addViews() {
        self.addSubview(labelDateDay)
        self.addSubview(labelDateHour)
        self.addSubview(labelStadium)
        self.addSubview(labelHomeName)
        self.addSubview(labelAwayName)
        self.addSubview(labelHomeScore)
        self.addSubview(labelAwayScore)
        self.addSubview(imageViewHomeCrest)
        self.addSubview(imageViewAwayCrest)
        self.addSubview(imageViewDivison)
    }
    
    func layoutViews() {
        //Header
        labelDateDay.snp.makeConstraints { make in
            make.left.topMargin.equalToSuperview().offset(20)
        }
        
        labelDateHour.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(20)
            make.top.equalToSuperview().offset(20)
        }
        
        labelStadium.snp.makeConstraints { make in
            make.left.equalTo(labelDateDay.snp.right)
            make.right.equalTo(labelDateHour.snp.left)
            make.centerY.equalTo(labelDateDay.snp.centerY)
            make.centerX.equalToSuperview()

        }
        
        //Teams
        imageViewHomeCrest.snp.makeConstraints { make in
            make.height.equalTo(100)
            make.width.equalTo(self).multipliedBy(0.25)
            make.left.equalToSuperview().offset(20)
            make.topMargin.equalTo(labelStadium.snp.bottomMargin).offset(30)
        }
        
        labelHomeName.snp.makeConstraints { make in
            make.topMargin.equalTo(imageViewHomeCrest.snp_bottomMargin).offset(20)
            make.centerX.equalTo(imageViewHomeCrest.snp.centerX)
        }
        
        imageViewAwayCrest.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(20)
            make.width.height.equalTo(self.imageViewHomeCrest)
            make.centerY.equalTo(imageViewHomeCrest.snp.centerY)
        }
        
        labelAwayName.snp.makeConstraints { make in
            make.topMargin.equalTo(imageViewAwayCrest.snp_bottomMargin).offset(20)
            make.centerX.equalTo(imageViewAwayCrest.snp.centerX)
        }

        imageViewDivison.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(imageViewHomeCrest).multipliedBy(0.2)
        }

        labelHomeScore.snp.makeConstraints { make in
            make.left.equalTo(imageViewHomeCrest.snp.right).offset(20)
            make.right.equalTo(imageViewDivison.snp.left).offset(20)
            make.centerY.equalToSuperview()
        }

        labelAwayScore.snp.makeConstraints { make in
            make.centerY.equalTo(labelHomeScore)
            make.left.equalTo(imageViewDivison.snp.right).offset(20)
            make.right.equalTo(imageViewAwayCrest.snp.left).offset(20)
        }
    }
    
    
    //Configs
    private func configHomeValues(team: Team) {
        labelHomeName.text = team.name
        imageViewHomeCrest.sd_setImage(with: URL(string: team.crestURL))
    }
    
    private func configAwayValues(team: Team) {
        labelAwayName.text = team.name
        imageViewAwayCrest.sd_setImage(with: URL(string: team.crestURL))
    }
    
    private func configMatchResult(result: MatchResult?) {
        guard let result = result else {
            labelHomeScore.text = ""
            labelAwayScore.text = ""
            return
        }
        labelHomeScore.text = "\(result.homeScore)"
        labelAwayScore.text = "\(result.awayScore)"
    }
    
    private func configLocation(location: Stadium) {
        labelStadium.text = location.name
    }
    
    private func configDate(match: Match) {
        self.labelDateDay.text = match.dateDayAndMonth
        self.labelDateHour.text = match.dateHour
    }
    
}
