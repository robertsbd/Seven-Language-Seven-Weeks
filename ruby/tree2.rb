class Tree
    attr_accessor :tree

    def initialize(tree)
        @tree = tree
    end 

    def visit_all
        @n = 0
        recurse_tree(@tree)
    end

    # this should be a private method
    def recurse_tree(the_tree)
        the_tree.each do |key, array|
            indicator_string = "-"*@n*5
            puts indicator_string+key
            @n += 1
            recurse_tree(array)
            @n -= 1
        end
    end
end

my_tree = 
    {'Frank Sinatra' => 
        {
            'Joey Ramone' => 
                {
                    'Jacki' => {}, 
                    'Judy' => {}
                },
            'Elvis Presley' => 
                {
                    'Dean Martin' => {
                        'Micheal Bubble' => {},
                        'Kenny G' => {}
                    }, 
                    'John Lennon' => {}
                }
        }
    }

Tree.new(my_tree).visit_all
