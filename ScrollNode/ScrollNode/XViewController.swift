//
//  XViewController.swift
//  ScrollNode
//
//  Created by Ken Cox on 3/31/19.
//  Copyright © 2019 Ken Cox. All rights reserved.
//

import AsyncDisplayKit

class XViewController: ASViewController<ASDisplayNode> {
    let containerNode = ASDisplayNode()
    let scrollNode = ASScrollNode()
    let titleNode = ASTextNode()
    let subtitleNode = ASTextNode()
    let summaryNode = ASTextNode()

    //MARK: - Lifecycle
    
    init() {
        super.init(node: containerNode)
        self.title = "Scroll Node"
        scrollNode.automaticallyManagesSubnodes = true
        scrollNode.automaticallyManagesContentSize = true
        scrollNode.layoutSpecBlock = { node, constrainedSize in
            let stack = ASStackLayoutSpec.vertical()
            stack.children = [self.titleNode, self.subtitleNode, self.summaryNode]
            return stack
        }
        // https://github.com/TextureGroup/Texture/issues/774
        containerNode.automaticallyManagesSubnodes = true
        containerNode.layoutSpecBlock = { node, constrainedSize in
            return ASWrapperLayoutSpec(layoutElement: self.scrollNode)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        setupNodes()
    }

    func setupNodes() {
        titleNode.attributedText = makeText("The Cat in the Hat", ofSize: 24)
        subtitleNode.attributedText = makeText("Dr. Suess", ofSize: 18)
        if Bool.random() {
            summaryNode.attributedText = makeText("""
Of all the layoutSpecs in Texture, ASStackLayoutSpec is the most useful and powerful. ASStackLayoutSpec uses the flexbox algorithm to determine the position and size of its children. Flexbox is designed to provide a consistent layout on different screen sizes. In a stack layout you align items in either a vertical or horizontal stack. A stack layout can be a child of another stack layout, which makes it possible to create almost any layout using a stack layout spec.

ASStackLayoutSpec has 7 properties in addition to its <ASLayoutElement> properties:

direction. Specifies the direction children are stacked in. If horizontalAlignment and verticalAlignment were set, they will be resolved again, causing justifyContent and alignItems to be updated accordingly.
spacing. The amount of space between each child.
horizontalAlignment. Specifies how children are aligned horizontally. Depends on the stack direction, setting the alignment causes either justifyContent or alignItems to be updated. The alignment will remain valid after future direction changes. Thus, it is preferred to those properties.
verticalAlignment. Specifies how children are aligned vertically. Depends on the stack direction, setting the alignment causes either justifyContent or alignItems to be updated. The alignment will remain valid after future direction changes. Thus, it is preferred to those properties.
justifyContent. It defines the alignment along the main axis.
alignItems. Orientation of children along cross axis.
flexWrap. Whether children are stacked into a single or multiple lines. Defaults to single line.
alignContent. Orientation of lines along cross axis if there are multiple lines.
""")
        } else {
            summaryNode.attributedText = makeText("""
No summary today.
""")
        }
    }
    
    func makeText(_ str: String, ofSize size: CGFloat = 17) -> NSAttributedString {
        let text = NSAttributedString(string: str, attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: size, weight: .semibold),
            NSAttributedString.Key.foregroundColor: UIColor.black
            ])
        return text
    }

    /*
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        let imageWidth = 50.0
        let imageHeight = imageWidth * 1.6
        
        let lhsSpec = ASStackLayoutSpec.vertical()
        lhsSpec.style.flexShrink = 1.0
        lhsSpec.style.flexGrow = 1.0
        lhsSpec.style.preferredSize = CGSize(width: 0, height: imageHeight)
        spacerNode.style.flexShrink = 1.0
        spacerNode.style.flexGrow = 1.0
        lhsSpec.children = [titleNode, spacerNode, authorNode, formatNode]
        
        imageNode.style.preferredSize = CGSize(width: imageWidth, height: imageHeight)
        disclosureNode.style.preferredSize = CGSize(width: 27, height: 27)
        
        let rhsSpec = ASStackLayoutSpec(direction: .horizontal, spacing: 0, justifyContent: .start, alignItems: .center, children: [imageNode, disclosureNode])
        
        let rowSpec = ASStackLayoutSpec(direction: .horizontal,
                                        spacing: 8,
                                        justifyContent: .start,
                                        alignItems: .center,
                                        children: [lhsSpec, rhsSpec])
        
        let spec = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 4.0, left: 8.0, bottom: 4.0, right: 4.0), child: rowSpec)
        //print(spec.asciiArtString())
        return spec
    }
    */
}

