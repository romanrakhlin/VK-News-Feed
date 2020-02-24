//
//  TitleView.swift
//  VK News Feed
//
//  Created by Roman Rakhlin on 09.02.2020.
//  Copyright © 2020 Roman Rakhlin. All rights reserved.
//

import UIKit
import VKSdkFramework

protocol TitleViewDelegate: class {
    func buttonLogOutSession(sender: UIButton)
}

protocol TitleViewViewModel {
    var photoUrlString: String? { get }
    var name: String { get }
}

class TitleView: UIView {

    weak var delegate: TitleViewDelegate?

    private var buttonLogOutSession: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        button.setTitleColor(#colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1), for: .normal)
        button.contentHorizontalAlignment = .left
        button.contentVerticalAlignment = .center
        button.setTitle("Выйти", for: .normal)
        return button
    }()

    private var myName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.textAlignment = .center
        return label
    }()

    private var myAvatarView: WebImageView = {
        let imageView = WebImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .orange
        imageView.clipsToBounds = true
        return imageView
    }()

    // MARK: init
    override init(frame: CGRect) {
        super.init(frame: frame)

        buttonLogOutSession.addTarget(self, action: #selector(buttonLogOut), for: .touchUpInside)

        translatesAutoresizingMaskIntoConstraints = false
        addSubview(buttonLogOutSession)
        addSubview(myName)
        addSubview(myAvatarView)

        makeConstraints()
    }

    // MARK: button alert
    @objc func buttonLogOut(sender: UIButton) {
        print(#function)
        delegate?.buttonLogOutSession(sender: sender)
    }

    // MARK: set data
    func set(userViewModel: TitleViewViewModel) {
        myAvatarView.set(imageURL: userViewModel.photoUrlString)
        myName.text = userViewModel.name
    }

    // MARK: make constraints
    private func makeConstraints() {
        buttonLogOutSession.anchor(top: topAnchor,
                                    leading: leadingAnchor,
                                    bottom: nil,
                                    trailing: nil,
                                    padding: UIEdgeInsets(top: 10, left: 4, bottom: 777, right: 777),
                                    size: CGSize(width: 50, height: 20))

        myName.anchor(top: topAnchor,
                      leading: leadingAnchor,
                      bottom: nil,
                      trailing: trailingAnchor,
                      padding: UIEdgeInsets(top: 10, left: 8, bottom: 777, right: 8),
                      size: CGSize(width: 0, height: 20))

        myAvatarView.anchor(top: topAnchor,
                            leading: nil,
                            bottom: nil,
                            trailing: trailingAnchor,
                            padding: UIEdgeInsets.init(top: 4, left: 777, bottom: 777, right: 4))
        myAvatarView.heightAnchor.constraint(lessThanOrEqualToConstant: 36).isActive = true
        myAvatarView.widthAnchor.constraint(lessThanOrEqualToConstant: 36).isActive = true
    }

    override var intrinsicContentSize: CGSize {
        return UIView.layoutFittingExpandedSize
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        myAvatarView.layer.masksToBounds = true
        myAvatarView.layer.cornerRadius = myAvatarView.frame.width / 2
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
