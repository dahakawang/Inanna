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
      spec = StructureSpec.instance
      if root.children_count == 0 && root.level == spec.paragraph_level - 1
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

      body_node = StructureTreeNode.new(node.content[(title.length)..(node.content.length - 1)], node.level+1)
      node.content = title.strip
      node.append_child(body_node)
    end
  end

  class ParagraphExtraxtProcessor
    include Singleton

    def config(param = {})
    end

    def process(root)
      spec = StructureSpec.instance
      
      if root.children_count == 1 && root.children[0].level == spec.paragraph_level
        subdivide_to_paragraph(root)
      else
        root.children.each do |child|
          process(child)
        end
      end
    end

    def subdivide_to_paragraph(root)
      spec = StructureSpec.instance
      content = root.children[0].content # the undivided paragraph
      children = []

      line_it = content.lines
      line_it.each do |line|
        next if (line =~ /^[\s]*$[\n]*/) # ignore empty paragraphs
        children.push(StructureTreeNode.new(line.strip, spec.paragraph_level))
      end

      root.set_children(children)
    end
  end
end