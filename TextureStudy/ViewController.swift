//
//  ViewController.swift
//  TextureStudy
//
//  Created by ByungHoon Ann on 2023/08/08.
//

import UIKit

import AsyncDisplayKit

class TextCellNode: ASCellNode {
    private let textNode = ASTextNode()
    
    init(text: String) {
        super.init()
        
        textNode.attributedText = NSAttributedString(string: text, attributes: [
            .font: UIFont.systemFont(ofSize: 16),
            .foregroundColor: UIColor.black
        ])
        
        automaticallyManagesSubnodes = true
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASInsetLayoutSpec(
            insets: UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15),
            child: textNode
        )
    }
}

class ViewController: UIViewController, ASTableDataSource {
    private let tableNode = ASTableNode()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableNode.dataSource = self
        view.addSubnode(tableNode)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableNode.frame = view.bounds
    }
    
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeForRowAt indexPath: IndexPath) -> ASCellNode {
        return TextCellNode(text: "Row \(indexPath.row)")
    }
}
