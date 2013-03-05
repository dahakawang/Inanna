# encoding: UTF-8
require 'support'
require 'structure_spec'
require 'singleton'

module Inanna
  class StructureTreeNode

    attr_accessor :content  # utf-8 string
    attr_reader :children    # children StructureTree in order

    def initialize(content)
      Support::ensure_utf8(content)

      @content = content
      @children = []
    end

    def append_child(child)
      @children.push(child)
    end

    def refine_content(range)
      @content = @content[range]
    end

    def children_count
      @children.length
    end
  end

  class StructureTreeBuilder
    include Singleton

    def build_tree(text)
      book = StructureTreeNode.new(text)
      parse_levels_recursively(0, book)

      book
    end

    def parse_one_level(level, node)
      regexp = Regexp.new StructureSpec.instance.levels[level]
      result = []

      node.content.scan regexp do
        result.push($~.offset(0))
      end
      result.push([node.content.length - 1])

      0.upto(result.length - 2) do |i| #we pushed an extra element so substract 2 here
        subrange = (result[i][0])..(result[i+1][0] - 1)
        child_content = node.content[subrange]
        child = StructureTreeNode.new(child_content)
        node.append_child(child)
      end
      node.refine_content(0..(result[0][0] - 1))
    end

    def parse_levels_recursively(cur_level, root)
      processing_level = cur_level + 1
      if processing_level <= StructureSpec.instance.level_count
        parse_one_level(processing_level, root)

        root.children.each do |child|
          parse_levels_recursively(processing_level, child)
        end
      end
    end
  end
end