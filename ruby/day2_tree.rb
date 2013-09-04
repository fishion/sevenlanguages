#!/usr/bin/ruby

class Tree
    attr_accessor :children, :node_name

    def initialize(name, children=[])
        @children = children
        @node_name = name
    end

    def visit_all(&block)
        visit &block
        children.each {|c| c.visit_all &block}
    end

    def visit(&block)
        block.call self
    end
end

rtree = Tree.new(
    "Ruby",
    [Tree.new('Reia'), Tree.new('MacRuby')]
)

puts "visiting a node"
rtree.visit {|node| puts node.node_name}

puts "visiting entire tree"
rtree.visit_all {|node| puts node.node_name}
