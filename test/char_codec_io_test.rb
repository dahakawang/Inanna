# encoding: UTF-8
require 'test/unit'
require 'char_codec_io.rb'

class TestCharCodecIO < Test::Unit::TestCase
    STR_CONST = "任何读过黑塞作品的人，都会为黑塞作品中的人生阅历与感悟，以及浪漫气息所打动，情不自禁回忆起自己的青年时代。青年没能在青年时代阅读黑塞，是一个极大的损失，尽管成年之后，重读时，会感受到这种懊悔，这就是一位只要有过阅读，就一定会喜欢上的作家，一个性情中人，坦率的朋友，人生的导师。\n"

    def test_decodeFromFile_utf16_support
      codec = Inanna::CharCodecIO.new
      data = nil

      assert_nothing_raised(Inanna::EncodingNotDetectError) do
        data = codec.decodeFromFile("test/TextData/sample-utf16.txt")
      end
      assert_equal STR_CONST, data
    end

    def test_decodeFromFile_utf8_support
      codec = Inanna::CharCodecIO.new
      data = nil

      assert_nothing_raised(Inanna::EncodingNotDetectError) do
        data = codec.decodeFromFile("test/TextData/sample-utf8.txt")
      end
      assert_equal STR_CONST, data
    end

    def test_decodeFromFile_gbk_support
      codec = Inanna::CharCodecIO.new
      data = nil

      assert_nothing_raised(Inanna::EncodingNotDetectError) do
        data = codec.decodeFromFile("test/TextData/sample-gbk.txt")
      end
      assert_equal STR_CONST, data
    end

    def test_decodeFromFile_raise_on_not_supported_encoding
      codec = Inanna::CharCodecIO.new
      data = nil

      data = codec.decodeFromFile("test/TextData/sample-big5.txt")
      assert_not_equal STR_CONST, data
    end
    
end