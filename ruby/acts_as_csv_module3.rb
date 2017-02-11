module ActsAsCsv

    def self.included(base)
        base.extend ClassMethods
    end

    module ClassMethods
        def acts_as_csv
            include InstanceMethods
        end
    end

    module InstanceMethods

        def read
            @csv_contents = []
            filename = self.class.to_s.downcase + '.txt'
            file = File.new(filename)
            @headers = file.gets.chomp.split(', ')

            file.each do |row|
                @csv_contents << row.chomp.split(', ')
            end
        end
        
        attr_accessor :headers, :csv_contents

        def initialize
            read
        end

        def each
            for i in 0..@csv_contents.size-1    
                yield @csv_contents[i][1]
            end
            #puts self #= @csv_contents.each(&block)
        end

        

        def method_missing(sym, *args, &block)
            puts sym
        end

    end
end

#def method_missing(sym, *args, &block)
#    puts sym.to_s
#end

class RubyCsv
    include ActsAsCsv
    acts_as_csv
end

csv = RubyCsv.new
csv.each {|row| puts row.one}