# encoding: UTF-8
require 'test/unit'
require 'char_codec_io.rb'

module Inanna
  class TestCharCodecIO < Test::Unit::TestCase
      STR_CONST = "任何读过黑塞作品的人，都会为黑塞作品中的人生阅历与感悟，以及浪漫气息所打动，情不自禁回忆起自己的青年时代。青年没能在青年时代阅读黑塞，是一个极大的损失，尽管成年之后，重读时，会感受到这种懊悔，这就是一位只要有过阅读，就一定会喜欢上的作家，一个性情中人，坦率的朋友，人生的导师。"
      STR_CONST2 = "任何讀過黑塞作品的人，都會為黑塞作品中的人生閱歷與感悟，以及浪漫氣息所打動，情不自禁回憶起自己的青年時代。青年沒能在青年時代閱讀黑塞，是一個極大的損失，儘管成年之後，重讀時，會感受到這種懊悔，這就是一位只要有過閱讀，就一定會喜歡上的作家，一個性情中人，坦率的朋友，人生的導師。"

      def test_decode_from_file_utf16le_support
        codec = Inanna::CharCodecIO.new
        data = nil

        assert_nothing_raised(Inanna::EncodingNotDetectError) do
          data = codec.decode_from_file("test/TextData/sample-utf16le.txt")
        end
        assert_equal "UTF-16LE", codec.last_encoding
        assert_equal STR_CONST, data
      end

      def test_decode_from_file_utf16be_support
        codec = Inanna::CharCodecIO.new
        data = nil

        assert_nothing_raised(Inanna::EncodingNotDetectError) do
          data = codec.decode_from_file("test/TextData/sample-utf16be.txt")
        end
        assert_equal "UTF-16BE", codec.last_encoding
        assert_equal STR_CONST, data
      end


      def test_decode_from_file_utf8_support
        codec = Inanna::CharCodecIO.new
        data = nil

        assert_nothing_raised(Inanna::EncodingNotDetectError) do
          data = codec.decode_from_file("test/TextData/sample-utf8.txt")
        end
        assert_equal "UTF-8", codec.last_encoding
        assert_equal STR_CONST, data
      end

      def test_decode_from_file_gbk_support
        codec = Inanna::CharCodecIO.new
        data = nil

        assert_nothing_raised(Inanna::EncodingNotDetectError) do
          data = codec.decode_from_file("test/TextData/sample-gbk.txt")
        end
        assert_equal "GBK", codec.last_encoding
        assert_equal STR_CONST, data
      end

      def test_decode_from_file_not_supported_encoding
        codec = Inanna::CharCodecIO.new
        data = nil

        data = codec.decode_from_file("test/TextData/sample-big5.txt")
        assert_not_equal STR_CONST2, data
      end

      def test_decode_from_file_and_specify_encoding
        codec = Inanna::CharCodecIO.new
        data = nil

        codec.specify_encoding("BIG5")
        assert_nothing_raised(Inanna::EncodingNotDetectError) do
          data = codec.decode_from_file("test/TextData/sample-big5.txt")
        end
        assert_equal "BIG5", codec.last_encoding
        assert_equal STR_CONST2, data
      end
  end
end