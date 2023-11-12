//
//  UserTitleTimeDescriptionView.swift
//  UIViewKit
//
//  Created by Blazej SLEBODA on 18/09/2023.
//

import UIKit
import UIViewKit

public class UserTitleTimeDescriptionView: UIView {

    var imageViewUser: UIImageView!
    var labelTime: UILabel!
    var labelTitle: UILabel!
    var labelDescription: UILabel!

    var totoView: UIView!
    var tuut: UIScrollView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self {
            UIStackView(axis: .horizontal, spacing: 12, alignment: .top) {
                UIImageView().ibOutlet(&imageViewUser).ibAttributes {
                    $0.widthAnchor.constraint(equalToConstant: 60)
                    $0.heightAnchor.constraint(equalToConstant: 60)
                    $0.setContentHuggingPriority(.defaultHigh + 1, for: .horizontal)
                }
                UIStackView(axis: .vertical) {
                    UIStackView(axis: .horizontal, spacing: 8, alignment: .center) {
                        UILabel().ibOutlet(&labelTitle).ibAttributes {
                            $0.font = .systemFont(ofSize: 20, weight: .semibold)
                        }
                        UIStackView(axis: .horizontal, spacing: 8) {
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
                        $0.heightAnchor.constraint(equalToConstant: 10)
                    }
                    UIView().ibAttributes {
                        $0.heightAnchor.constraint(equalToConstant: 1)
                        $0.backgroundColor = .systemGray4
                    }
                }
            }.ibAttributes {
                $0.ibConstraints(to: self, guide: .view, anchors: .top, .left(12), .right(-12), .bottom)
            }
        }
    }

    required init?(coder: NSCoder) { fatalError() }
}

#if DEBUG

import SwiftUI

struct UserTitleTimeDescriptionViewPreviews: PreviewProvider {
    static var previews: some View {
        IBRepresentableForView(
            UserTitleTimeDescriptionView().ibAttributes {
                $0.imageViewUser.image = .init(systemName: "person.circle")
                $0.labelTitle.text = "Amanda Clarke"
                $0.labelTime.text = "1:08 PM"
                $0.labelDescription.text = "Hey, how are you doing today? I have got a question about our trip to Mexi..."
                UIViewDebug.showFrames(of: $0, includeGivenView: true, includeUIKitPrivateViews: false)
            }
        )
    }
}

#endif
