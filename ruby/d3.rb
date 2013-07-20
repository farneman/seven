#!/usr/bin/env ruby

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
			puts filename
			file = File.new(filename)
			@headers = file.gets.chomp.split(', ')

			file.each do |row|
				@csv_contents << row.chomp.split(', ')
			end
		end

		def each(&block)
			for r in @csv_contents
				row = CsvRow.new(r, @headers)
				block.call row
			end
		end

		attr_accessor :headers, :csv_contents
		def initialize
			read
		end
	end
end

class CsvRow
	attr_accessor :row, :cols
	def initialize(r, headers)
		@row = r
		@cols = headers
	end

	def method_missing(name, *args)
		col_name = name.to_s
		if @cols.include?(col_name)
			return @row[@cols.index(col_name)]
		end
	end
end

class	RubyCsv
	include ActsAsCsv
	acts_as_csv
end

# run with example csv
csv = RubyCsv.new
puts csv.headers.inspect
puts csv.csv_contents.inspect
csv.each {|row| puts row.one} # should print "lions"
