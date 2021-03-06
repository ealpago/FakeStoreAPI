//  BaseButton.swift
//  2N-mobile-communicator
//
//  Created by Martin Troup on 25.11.16.
//  Copyright © 2016 quanti. All rights reserved.
//
import UIKit

class BaseButton: UIButton {
    public typealias Action = ((_ sender: UIButton) -> Void)
    public var actionBlock: Action?
    
    public var baseColor: UIColor = .clear {
        didSet {
            if !isHighlighted {
                self.backgroundColor = baseColor
            }
        }
    }
    
    public var highlightedColor: UIColor = .clear {
        didSet {
            if isHighlighted {
                self.backgroundColor = highlightedColor
            }
        }
    }
    
    public var borderColor: UIColor = .clear {
        didSet {
            if isEnabled {
                set(borderColor: borderColor)
            }
        }
    }
    
    public var disabledBorderColor: UIColor = .clear {
        didSet {
            if !isEnabled {
                set(borderColor: disabledBorderColor)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    
    func commonInit() {
        
        imageView?.clipsToBounds = false
        imageView?.contentMode = .center
        adjustsImageWhenHighlighted = false
        
        self.addTarget(self, action: #selector(self.touchUpInsideAction(sender:)), for: .touchUpInside)
        self.baseColor = .clear
    }
    
    convenience init(ofSize size: CGFloat) {
        self.init()
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: size).isActive=true
        self.widthAnchor.constraint(equalToConstant: size).isActive=true
    }
    
    public convenience init(with image: UIImage? = nil) {
        self.init()
        
        if let _image = image {
            setImage(_image.withRenderingMode(.alwaysTemplate), for: .normal)
        }
    }
    
    
    
    open override var isEnabled: Bool {
        didSet {
            isEnabled ? set(borderColor: borderColor) : set(borderColor: disabledBorderColor)
        }
    }
    
    open override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? highlightedColor : baseColor
        }
    }
    
    private func set(borderColor color: UIColor) {
        self.layer.borderWidth = 1
        self.layer.borderColor = color.cgColor
    }
    
    // MARK: - Button callbacks
    @objc private func touchUpInsideAction(sender: UIButton) {
        self.actionBlock?(sender)
    }
    
}
