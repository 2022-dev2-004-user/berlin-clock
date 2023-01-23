//
//  BerlinClockViewController.swift
//  Berlin-Clock
//
//  Created by 2022-dev2-004 on 22/01/2023.
//

import UIKit

class BerlinClockViewController: UIViewController {
    //MARK: - Layout
    
    class Layout {
        static let roundBlockWidth: CGFloat = 60
        static let roundBlockHeight: CGFloat = 60
        static let roundBlockCornerRadius: CGFloat = 30
    }
    
    //MARK: - Properties
    
    private lazy var mainStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.spacing = 8
        return stack
    }()
    
    private lazy var roundBlock: Block = {
        let block = Block()
        block.translatesAutoresizingMaskIntoConstraints = false
        block.layer.cornerRadius = Layout.roundBlockCornerRadius
        block.widthAnchor.constraint(equalToConstant: Layout.roundBlockWidth).isActive = true
        block.heightAnchor.constraint(equalToConstant: Layout.roundBlockHeight).isActive = true
        return block
    }()
    
    private lazy var firstHourStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 8
        
        for i in 1...4 {
            let block = SquareBlock()
            if i == 1 {
                block.roundCorners(.topLeft)
            } else if i == 4 {
                block.roundCorners(.topRight)
            }
            stack.addArrangedSubview(block)
        }
        return stack
    }()
    
    private lazy var secondHourStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 8
        
        for i in 1...4 {
            let block = SquareBlock()
            stack.addArrangedSubview(block)
        }
        return stack
    }()
    
    private lazy var firstMinuteStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 8
        
        for i in 1...11 {
            let block = SquareBlock()
            stack.addArrangedSubview(block)
        }
        return stack
    }()
    
    private lazy var secondMinuteStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 8
        
        for i in 1...4 {
            let block = SquareBlock()
            if i == 1 {
                block.roundCorners(.bottomLeft)
            } else if i == 4 {
                block.roundCorners(.bottomRight)
            }
            stack.addArrangedSubview(block)
        }
        return stack
    }()
    
    private lazy var clockLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        return label
    }()
    
    var viewModel = BerlinClockViewModel()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(mainStackView)
        mainStackView.addArrangedSubview(roundBlock)
        mainStackView.addArrangedSubview(firstHourStackView)
        mainStackView.addArrangedSubview(secondHourStackView)
        mainStackView.addArrangedSubview(firstMinuteStackView)
        mainStackView.addArrangedSubview(secondMinuteStackView)
        mainStackView.addArrangedSubview(clockLabel)
        
        setupConstraints()
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.viewModel.generateClock()
            self.updateClock()
        }
    }
    
    //MARK: - Clock Updater
    
    private func updateClock() {
        roundBlock.setBackgroundColor(for: viewModel.secondsBlock)
        setBackgroundColor(for: firstHourStackView, type: .hours, blocksOn: viewModel.fiveHoursBlocks)
        setBackgroundColor(for: secondHourStackView, type: .hours, blocksOn: viewModel.singleHourBlocks)
        setBackgroundColor(for: firstMinuteStackView, type: .firstMinutes, blocksOn: viewModel.fiveMinuteBlocks)
        setBackgroundColor(for: secondMinuteStackView, type: .secondMinutes, blocksOn: viewModel.singleMinuteBlocks)
        clockLabel.text = viewModel.currentTime
    }
    
    //MARK: - UI Config
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(greaterThanOrEqualTo: view.topAnchor, constant: 16),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            mainStackView.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -16),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            mainStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            firstHourStackView.leadingAnchor.constraint(lessThanOrEqualTo: mainStackView.leadingAnchor),
            firstHourStackView.trailingAnchor.constraint(lessThanOrEqualTo: mainStackView.trailingAnchor),
            secondHourStackView.leadingAnchor.constraint(lessThanOrEqualTo: mainStackView.leadingAnchor),
            secondHourStackView.trailingAnchor.constraint(lessThanOrEqualTo: mainStackView.trailingAnchor),
            firstMinuteStackView.leadingAnchor.constraint(lessThanOrEqualTo: mainStackView.leadingAnchor),
            firstMinuteStackView.trailingAnchor.constraint(lessThanOrEqualTo: mainStackView.trailingAnchor),
            secondMinuteStackView.leadingAnchor.constraint(lessThanOrEqualTo: mainStackView.leadingAnchor),
            secondMinuteStackView.trailingAnchor.constraint(lessThanOrEqualTo: mainStackView.trailingAnchor),
        ])
    }
    
    private func setBackgroundColor(for stack: UIStackView, type: SquareBlocksType, blocksOn: Int) {
        var counter = 1
        
        stack.arrangedSubviews.forEach { view in
            let block = view as! SquareBlock
            
            if counter <= blocksOn {
                if type == .hours || (type == .firstMinutes && counter % 3 == 0) {
                    block.setBackgroundColor(for: .red)
                } else {
                    block.setBackgroundColor(for: .yellow)
                }
            } else {
                block.setBackgroundColor(for: .off)
            }
            counter += 1 
        }
    }
}

