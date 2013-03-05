# encoding: UTF-8
require 'singleton'
require 'structure_tree'
require 'structure_spec'

module Inanna
  class ChapterTitleExtractProcessor
    include Singleton

    def config(param = {})
      @title_length = 20
      length_to_set = param[:title_length]
      @title_length = length_to_set if length_to_set 
    end

    def process(root)
      root.children.each do |child|
        process(child)
      end

      # this node is leaf
      if root.children_count == 0
        extract_main_content(root)
      end
    end

    def extract_main_content(node)
      spec = StructureSpec.instance
      regexp = Regexp.new spec.levels[spec.level_count]
      match = regexp.match(node.content)
      
      title = match[0]
      candidate = node.content.lines.next # the first line 
      title = candidate if(candidate.length <= @title_length)

      body_node = StructureTreeNode.new(node.content[(title.length)..(node.content.length - 1)])
      node.content = title.strip
      node.append_child(body_node)
    end

  end
end