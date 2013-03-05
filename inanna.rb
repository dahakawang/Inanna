# encoding: UTF-8
require 'structure_spec'
require "char_codec_io"
require 'structure_tree'

module Inanna

  spec = StructureSpec.instance
  spec.load_specification(nil)


  codec = CharCodecIO.new
  text = codec.decode_from_file("test/TextData/sample-utf16le.txt")
  codec.last_encoding


  novel_tree = StructureTreeBuilder.instance.build_tree(text)
  



end