# encoding: UTF-8
$LOAD_PATH << File.dirname(__FILE__)

require 'structure_spec'
require "char_codec_io"
require 'structure_tree'
require 'tree_serializer'
require 'tree_processors'
require 'ruby-debug'
module Inanna

  spec = StructureSpec.instance
  spec.load_specification(nil)


  codec = CharCodecIO.new
  text = codec.decode_from_file("test.txt")
  codec.last_encoding


  novel_tree = StructureTreeBuilder.instance.build_tree(text)
  
  processor = ChapterTitleExtractProcessor.instance
  processor.config
  processor.process(novel_tree)

  processor = ParagraphExtraxtProcessor.instance
  processor.config
  processor.process(novel_tree)
  
  
  ts = TreeSerializer.instance
  html = ts.serialize(novel_tree)

  codec.encode_to_file("out.html", html)
end