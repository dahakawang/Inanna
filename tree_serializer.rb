# encoding: UTF-8
require 'structure_tree'
require 'structure_spec'
require 'singleton'

module Inanna
  # this class converts structure tree to stream of bytes
  # which is marked by HTML tags
  class TreeSerializer
    include Singleton

    TAGS = {
      0 => "BODY",
      1 => "H1",
      2 => "H2",
      3 => "H3",
      4 => "H4",
      5 => "H5",
      6 => "H6",
      7 => "P",
    }

    def serialize(tree)
      raise ArgumentError, "Only StructureTreeNode instances are acceptable." unless tree.kind_of? StructureTreeNode
      
      str = "" # buffer to hold serialized bytes
      traversal_tree(tree, str)
      str
    end

    def traversal_tree(node, stream)
      stream << '<?xml version="1.0" encoding="UTF-8" ?>'
      stream << '<HTML>'
      stream << open_tag_for(node)

      node.children.each do |child|
        traversal_tree_impl(child, stream)
      end

      stream << close_tag_for(node)
      stream << '/HTML'
    end

    def traversal_tree_impl(node, stream)
      stream << open_tag_for(node) << node.content << close_tag_for(node)
      node.children.each do |child|
        traversal_tree_impl(child, stream)
      end
    end

    def open_tag_for(node)
      "<" << get_tag(node.level) << ">"
    end

    def close_tag_for(node)
      "</" << get_tag(node.level) << ">"
    end

    def get_tag(level)
      spec = StructureSpec.instance
      return TAGS[7] if level == spec.paragraph_level

      TAGS[level]
    end

  end
end