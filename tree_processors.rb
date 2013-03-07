# encoding: UTF-8
require 'singleton'
require 'structure_tree'
require 'structure_spec'

module Inanna
  # This class is deprecated
  # use TreeNormalizeProcessor instead
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
      title = nil
      
      if match
        title = match[0]
        candidate = node.content.lines.next # the first line 
        title = candidate if(candidate.length <= @title_length)
      else
        title = ""
      end

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

  class TreeNormalizeProcessor
    include Singleton

    def config(param = {})
      @title_length = param[:title_length] || 20
    end

    def process(root)
     do_normalize(root)
    end

    def do_normalize(root)
      # we do postorder traversal here to retain the text's literal order
      root.children.each do |child|
        do_normalize(child)
      end
      normalize_node(root)
    end

    def normalize_node(node)
      spec = StructureSpec.instance
      title, content = extrct_title_body(node)

      node.set_content(title)
      if content.strip != ""
        parent = node

        # we'll build stub nodes from current level downto paragraph level
        from = node.level + 1
        from.upto(spec.level_count) do |level|
          node = StructureTreeNode.new("", level)
          parent.unshift_child(node)
          parent = node
        end

        normalized_body = StructureTreeNode.new(content, spec.paragraph_level)
        parent.unshift_child(normalized_body)
      end
    end

    # the node should never be a paragraph level
    def extrct_title_body(node)
      spec = StructureSpec.instance
      raise RuntimeError, "extrct_title_body do not accept a paragraph node" if node.level == spec.paragraph_level

      if node.level == spec.top_level
        return "", node.content
      else
        regexp = Regexp.new spec.levels[node.level]
        match = regexp.match(node.content)
        title = nil

        if match
          # TODO parse title by space not by line
          title = match[0]
          candidate = node.content.lines.next # the first line 
          title = candidate if(candidate.length <= @title_length)
        else # the stub node will not have title
          title = ""
        end

        content = node.content[(title.length)..(node.content.length - 1)]
        return title.strip, content
      end
    end
  end
end
