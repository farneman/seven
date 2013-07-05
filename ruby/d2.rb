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

	def initialize(tree={})
		@node_name = tree.keys[0]
		@children = tree[@node_name].collect{|k, v| Tree.new({k => v})}
	end

	def visit_all(&block)
		visit &block
		children.each {|c| c.visit_all &block}
	end

	def visit(&block)
		block.call self
	end
end

# ruby_tree = Tree.new({'grandpa' => {'dad' => {'child_1' => {}, 'child_2' => {}}, 'uncle' => {'child_3' => {}, 'child_4' => {}}}})
# 
# puts 'visiting a node'
# ruby_tree.visit {|node| puts node.node_name}
# puts
# 
# puts 'visiting all nodes'
# ruby_tree.visit_all {|node| puts node.node_name}
# puts


def print_matching_lines(file, phrase)
	matcher = Regexp.new phrase
	File.open(file) do |f|
		f.each_line.with_index {|line, i| puts i.to_s + ': ' + line if line.match matcher}
	end
end

print_matching_lines('test.txt', 'hi')
