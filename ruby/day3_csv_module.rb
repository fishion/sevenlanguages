#!/usr/bin/ruby

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
        attr_accessor :headers, :csv_contents
        def read
            @csv_contents = []
            filename = self.class.to_s.downcase + '.txt'
            file = File.new(filename)
            @headers = file.gets.chomp.split(', ')
            file.each do |line|
                @csv_contents << CsvRow.new(line.chomp.split(', '), @headers)
            end
        end

        def each (&block)
            @csv_contents.each {|line| block.call line}
        end

        def initialize
            read
        end
    end
end

class CsvRow < Array
    def initialize items, headers
        @headers = headers
        super items
    end
    def method_missing name, *args
        return "Column not found" unless @headers.index name.to_s
        return self[@headers.index name.to_s]
    end
end

class Day3_RubyCsv
    include ActsAsCsv
    acts_as_csv
end

m = Day3_RubyCsv.new
m.each do |line|
    puts "#{line} is a #{line.class}"
    puts "First element is '#{line.h1}'"
    puts "Second element is '#{line.h2}'"
    puts "Non existant element is '#{line.nonsense}'"
end
