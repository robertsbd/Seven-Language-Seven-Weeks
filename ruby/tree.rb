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


ruby_tree = Tree.new( "Ruby",
                [Tree.new("Reia",
                    [Tree.new("X"),
                    Tree.new("Y")]),
                Tree.new("MacRuby")] )

ruby_tree = 
    {'grampa' => 
        {
            'dad' => 
                {
                    'child 1' => {}, 
                    'child 2' => {}
                },
            'uncle' => 
                {
                    'child 3' => {}, 
                    'child 4' => {}
                }
        }
    }

def print_tree(tree)
    tree.each do |key, array|
        puts key
        print_tree(array)
    end
end

print_tree(ruby_tree)

=begin
ruby_tree.each do |key, array|
    puts key
    array.each do |key, array|
        puts key
        array.each do |key, array|
            puts key
        end
    end
end
=end

=begin
puts "Visiting a node"
ruby_tree.visit {|node| puts node.node_name}
ruby_tree.visit_all {|node| puts node.node_name}
=end