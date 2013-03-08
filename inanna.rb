# encoding: UTF-8
$LOAD_PATH << File.dirname(__FILE__)

require 'structure_spec'
require "char_codec_io"
require 'structure_tree'
require 'tree_serializer'
require 'tree_processors'

def print_help
  puts "Usage: inanna input.txt"
end

module Inanna
  if(ARGV.length != 1)
    print_help
    abort
  end


  spec = StructureSpec.instance
  spec.load_specification(nil)


  codec = CharCodecIO.new
  text = codec.decode_from_file(ARGV[0])
  codec.last_encoding


  novel_tree = StructureTreeBuilder.instance.build_tree(text)
  
  processor = TreeNormalizeProcessor.instance
  processor.config
  processor.process(novel_tree)

  processor = ParagraphExtraxtProcessor.instance
  processor.config
  processor.process(novel_tree)
  
  
  ts = TreeSerializer.instance
  html = ts.serialize(novel_tree)

  codec.encode_to_file("__out.temp.html", html)
end