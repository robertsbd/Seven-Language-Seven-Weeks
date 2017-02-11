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

        def method_missing name
            col = name.to_s
            hash = Hash[@headers.map.with_index.to_a]   # convert the headers to an array
            index = hash[col] # get the location in the array

            for i in 0..@csv_contents.size-1
                yield @csv_contents[i][index]
            end
            #.each(&block) # return only that row
        end

    end
end

class RubyCsv
    include ActsAsCsv
    acts_as_csv
end

csv = RubyCsv.new
csv.each {|row| puts row.one}