#!/usr/bin/ruby

class Tree
    attr_accessor :children, :node_name, :depth

    def initialize(name, tree={}, depth=0)
        @depth = depth
        @node_name = name
        children=[];
        tree.keys.each do |child|
            children.push(Tree.new(child, tree[child], depth+1))
        end
        @children = children
    end

    def visit_all(&block)
        visit &block
        children.each {|c| c.visit_all &block}
    end

    def visit(&block)
        block.call self
    end
end

rtree = Tree.new('Trunk', {
    'grandpa' => {
        'dad' => {
            'child1' => {},
            'child2' => {},
            'uncle' => {
                'child3' => {},
                'child4' => {},
            },
        },
    },
})

puts "visiting entire tree"
rtree.visit_all {|node| node.depth.times {print '  '}; puts node.node_name}

