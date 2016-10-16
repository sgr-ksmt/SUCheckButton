//
//  SUCheckButton.swift
//  SUCheckButtonTest
//
//  Created by Suguru Kishimoto on 2015/11/03.
//  Updated to Swift 3 by Omar Albeik on 2016/10/16
//  Copyright © 2015年 SFIDANTE Inc. All rights reserved.
//

import UIKit

@IBDesignable
public class SUCheckButton: UIControl {
	
	public struct Default {
		public static let buttonHeight: CGFloat = 30.0
		public static let checkedFillColor: UIColor = UIColor(red: 0.078, green: 0.435, blue: 0.875, alpha: 1.0)
		public static let uncheckedFillColor: UIColor = UIColor(white: 1.0, alpha: 0.6)
	}
	
	// MARK: - Properties
	
	// MARK: check status
	@IBInspectable public var checked: Bool = false {
		didSet {
			self.setNeedsDisplay()
		}
	}
	public var isChecked: Bool {
		get { return checked }
	}
	
	// MARK: stroke, border width
	@IBInspectable public var checkStrokeWidth: CGFloat = 1.5 {
		didSet {
			checkStrokeWidth = max(0.0, checkStrokeWidth)
			self.setNeedsDisplay()
		}
	}
	@IBInspectable public var borderWidth: CGFloat = 1.0 {
		didSet {
			borderWidth = max(0.0, borderWidth)
			self.setNeedsDisplay()
		}
	}
	
	// MARK: checked color options
	@IBInspectable public var checkedColor: UIColor? = UIColor.white {
		didSet {
			self.setNeedsDisplay()
		}
	}
	@IBInspectable public var checkedFillColor: UIColor? = Default.checkedFillColor {
		didSet {
			self.setNeedsDisplay()
		}
	}
	@IBInspectable public var checkedBorderColor: UIColor? = UIColor.white {
		didSet {
			self.setNeedsDisplay()
		}
	}
	
	// MARK: unchecked color options
	@IBInspectable public var uncheckedColor: UIColor? = UIColor(white: 0.8, alpha: 1.0) {
		didSet {
			self.setNeedsDisplay()
		}
	}
	@IBInspectable public var uncheckedFillColor: UIColor? = Default.uncheckedFillColor {
		didSet {
			self.setNeedsDisplay()
		}
	}
	@IBInspectable public var uncheckedBorderColor: UIColor? = UIColor.white {
		didSet {
			self.setNeedsDisplay()
		}
	}
	
	// MARK: shadow color
	@IBInspectable public var shadowColor: UIColor? = UIColor.black {
		didSet {
			self.setNeedsDisplay()
		}
	}
	
	// MARK: animation settings
	@IBInspectable public var animationEnabled : Bool = true
	@IBInspectable public var animationScale: CGFloat = 1.05
	
	// MARK: highlight color
	@IBInspectable public var highlightColor: UIColor? = UIColor(white: 0.5, alpha: 0.3) {
		didSet {
			self.setNeedsDisplay()
		}
	}
	
	// MARK: -
	
	// MARK: check status changed handler when button pressed
	public typealias DidPressHandler = ((_ checked: Bool) -> Void)
	public var didPressHandler: DidPressHandler?
	
	// MARK: - initializer
	
	convenience public init() {
		let buttonHeight = Default.buttonHeight
		let square = CGSize(width: buttonHeight, height: buttonHeight)
		self.init(frame: CGRect(origin: CGPoint.zero, size: square))
	}
	
	override public init(frame: CGRect) {
		super.init(frame: frame)
		setup()
	}
	
	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setup()
	}
	
	private func setup() {
		//TODO: add code if needed.
	}
	
	// MARK: - draw methods
	override public func draw(_ rect: CGRect) {
		super.draw(rect)
		
		if isChecked {
			drawForChecked()
		} else {
			drawForUnchecked()
		}
		if self.isTracking {
			drawHighLight(color: self.highlightColor)
		}
	}
	
	private func drawForChecked() {
		drawOval(fillColor: self.checkedFillColor, borderColor: self.checkedBorderColor)
		drawCheckMark(checkMarkColor: self.checkedColor)
	}
	
	private func drawForUnchecked() {
		drawOval(fillColor: self.uncheckedFillColor, borderColor: self.uncheckedBorderColor)
		drawCheckMark(checkMarkColor: self.uncheckedColor)
	}
	
	private func getOvalFrame() -> CGRect {
		let f = self.bounds
		let dx: CGFloat = 4.0
		let dy: CGFloat = 4.0
		return CGRect(
			x: f.minX + dx,
			y: f.minY + dy,
			width: f.width - dx * 2,
			height: f.height - dy * 2
		)
	}
	
	private func drawOval(fillColor: UIColor?, borderColor: UIColor?) {
		let ovalRect = getOvalFrame()
		let ovalPath = UIBezierPath(ovalIn: ovalRect)
		let context = UIGraphicsGetCurrentContext()
		let shadowOffset = CGSize(width: 0.1, height: -0.1)
		let shadowBlurRadius: CGFloat = 3.0
		
		context!.saveGState()
		context!.setShadow(offset: shadowOffset, blur: shadowBlurRadius, color: self.shadowColor?.cgColor)
		fillColor?.setFill()
		ovalPath.fill()
		context!.restoreGState()
		let borderInset = max(0.0, CGFloat(self.borderWidth/2 - 0.5))
		let borderPath = UIBezierPath(ovalIn: ovalRect.insetBy(dx: borderInset, dy: borderInset))
		borderColor?.setStroke()
		borderPath.lineWidth = self.borderWidth
		borderPath.stroke()
	}
	
	private func drawCheckMark(checkMarkColor: UIColor?) {
		let path = UIBezierPath()
		let ovalRect = getOvalFrame()
		let x = ovalRect.minX
		let y = ovalRect.minY
		let w = ovalRect.width
		let h = ovalRect.height
		path.move(to: CGPoint(x: x + w * 0.27, y: y + 0.54 * h))
		path.addLine(to: CGPoint(x: x + 0.42 * w, y: y + 0.69 * h))
		path.addLine(to: CGPoint(x: x + 0.75 * w, y: y + 0.35 * h))
		path.lineCapStyle = .square
		checkMarkColor?.setStroke()
		path.lineWidth = self.checkStrokeWidth
		path.stroke()
	}
	
	private func drawHighLight(color: UIColor?) {
		let ovalRect = getOvalFrame()
		let ovalPath = UIBezierPath(ovalIn: ovalRect)
		color?.setFill()
		ovalPath.fill()
	}
	
	// MARK: - scale animation
	
	private func scaleAnimation() {
		UIView.animate(withDuration: 0.15, delay: 0.0, options: .beginFromCurrentState, animations: { [weak self] in
			let scale = self?.animationScale ?? 1.0
			self?.transform = CGAffineTransform(scaleX: scale, y: scale)
			}, completion: { _ in
				UIView.animate(withDuration: 0.15, delay: 0.0, options: .beginFromCurrentState, animations: { [weak self] in
					self?.transform = CGAffineTransform.identity
					}, completion: { _ in
				})
		})
	}
	
	// MARK: - override tracking
	
	override public func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
		self.setNeedsDisplay()
		super.beginTracking(touch, with: event)
		return true
	}
	
	override public func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
		self.setNeedsDisplay()
		super.continueTracking(touch , with: event)
		return true
	}
	
	override public func endTracking(_ touch: UITouch?, with event: UIEvent?) {
		self.checked = !self.isChecked
		self.sendActions(for: .valueChanged)
		//TODO: blocks
		self.didPressHandler?(self.isChecked)
		self.setNeedsDisplay()
		if self.animationEnabled {
			scaleAnimation()
		}
		super.endTracking(touch, with: event)
	}
	
	override public func cancelTracking(with event: UIEvent?) {
		super.cancelTracking(with: event)
	}
}
