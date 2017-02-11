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

        def each(&block)
            # if each has been called using with a missing_method then will call missing method
            # otherwise just run the code block

            csvRows = []

            begin
                instance_eval &block
                csvRows = []
            rescue
                csvRows << @csv_contents.each(&block)
            end

            return csvRows
        end
        
        def method_missing(name) # this will return the column with the corresponding name
            hash = Hash[@headers.map.with_index.to_a]   # convert the headers to a hash
            index = hash[name.to_s] # get the location
            csvRows = []

            if index then # check that there is a col name that exists
                @csv_contents.each {|i| csvRows << i[index]} 
            else 
                csvRows = [] 
            end

            return csvRows 
        end

    end
end

class RubyCsv
    include ActsAsCsv
    acts_as_csv
end

csv = RubyCsv.new
csv.each {|row| puts row}