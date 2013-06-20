#!/usr/bin/env ruby

# Print array of 16 nums 4 at a time using each:
def print_4(arr)
	arr.each do |i| 
		i = (i - 1) * 4
		if i >= arr.size
			break
		end
		puts arr.slice(i,4) 
		puts
	end
end
def print_4_by_slice(arr)
	arr.each_slice(4) do |i| 
		puts i 
		puts
	end
end

# Better Tree class:
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
