//
//  UserTitleTimeDescriptionViewWithIBSubviewsWithSuperviewView.swift
//  UIViewKit
//
//  Created by Blazej SLEBODA on 18/09/2023.
//

import UIKit
import UIViewKit

public class UserTitleTimeDescriptionViewWithIBSubviewsWithSuperviewView: UIView {

    var imageViewUser: UIImageView!
    var labelTime: UILabel!
    var labelTitle: UILabel!
    var labelDescription: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.ibSubviews { _ in
            UIStackView(axis: .horizontal, spacing: 12, alignment: .top).ibSubviews { _ in
                UIImageView().ibOutlet(&imageViewUser).ibAttributes {
                    $0.widthAnchor.constraint(equalToConstant: 60)
                    $0.heightAnchor.constraint(equalToConstant: 60)
                    $0.setContentHuggingPriority(.defaultHigh + 1, for: .horizontal)
                }
                UIStackView(axis: .vertical).ibSubviews { _ in
                    UIStackView(axis: .horizontal, spacing: 8, alignment: .center).ibSubviews { _ in
                        UILabel().ibOutlet(&labelTitle).ibAttributes {
                            $0.font = .systemFont(ofSize: 20, weight: .semibold)
                        }
                        UIStackView(axis: .horizontal, spacing: 8).ibSubviews { _ in
                            UILabel().ibOutlet(&labelTime).ibAttributes {
                                $0.textColor = .systemGray
                                $0.font = .systemFont(ofSize: 15, weight: .semibold)
                            }
                            UIImageView().ibAttributes {
                                $0.setContentHuggingPriority(.required, for: .horizontal)
                                $0.widthAnchor.constraint(equalToConstant: 12)
                                $0.heightAnchor.constraint(equalToConstant: 12)
                                $0.image = .init(systemName: "chevron.right")
                                $0.contentMode = .scaleAspectFit
                                $0.tintColor = .systemGray
                            }
                        }
                    }
                    UIView().ibAttributes {
                        $0.heightAnchor.constraint(equalToConstant: 12)
                    }
                    UILabel().ibOutlet(&labelDescription).ibAttributes {
                        $0.numberOfLines = .zero
                        $0.textColor = .systemGray
                    }
                    UIView().ibAttributes {
                        $0.heightAnchor.constraint(equalToConstant: 20)
                    }
                    UIView().ibAttributes {
                        $0.heightAnchor.constraint(equalToConstant: 1)
                        $0.backgroundColor = .systemGray4
                    }
                }
            }.ibAttributes {
                $0.ibConstraints(to: self, anchors: .top, .left(12), .right(-12), .bottom)
            }
        }
    }

    required init?(coder: NSCoder) { fatalError() }
}
