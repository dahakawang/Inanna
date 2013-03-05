# encoding: UTF-8
require 'test/unit'
require 'structure_spec'

module Inanna
  class TestDefaultSpec <Test::Unit::TestCase
    
    DIGITS_CONST = %w(
      0 7 10 12 97 123 506 1294 4498 19287 99999
      ０  ７  １０  １２  ９７  １２３   ５０６   １２９４  ４４９８  １９２８７８ ９９９９９
      零 七  
      十 一十二 十二 二十 九十七 
      一百二十三 三百 三百零七 二百五十
      一千 一千零五 一千零二十 五千三百 一千零二十五  五千三百零五 五千三百二十 五千三百二十五
      一万  一万零五 两万零二十  三万零二百 四万五千 五万三千零五 五万三千零二十 五万三千六百 五万零三百零二 五万零三百三十 五万零三十六
      七万零三百二十五 七万五千零二十 七万六千五百零五 七万六千四百二十 九万两千三百七十二
      零 七
      十 一十二 十二 二十 九十七
      一百二十三 三百 三百零七 二百五十
      一千 一千零五 一千零二十 五千三百 一千零二十五 五千三百零五 五千三百二十 五千三百二十五
      一萬 一萬零五 兩萬零二十 三萬零二百 四萬五千 五萬三千零五 五萬三千零二十 五萬三千六百 五萬零三百零二 五萬零三百三十 五萬零三十六
      七萬零三百二十五 七萬五千零二十 七萬六千五百零五 七萬六千四百二十 九萬兩千三百七十二
      零 柒
      拾 壹拾贰 拾贰 贰拾 玖拾柒
      壹百贰拾叁 叁百 叁百零柒 贰百伍拾
      壹千 壹千零伍 壹千零贰拾 伍千叁百 壹千零贰拾伍 伍千叁百零伍 伍千叁百贰拾 伍千叁百贰拾伍
      壹萬 壹萬零伍 兩萬零贰拾 叁萬零贰百 肆萬伍千 伍萬叁千零伍 伍萬叁千零贰拾 伍萬叁千陆百 伍萬零叁百零贰 伍萬零叁百叁拾 伍萬零叁拾陆
      柒萬零叁百贰拾伍 柒萬伍千零贰拾 柒萬陆千伍百零伍 柒萬陆千肆百贰拾 玖萬兩千叁百柒拾贰
    )

    def test_digits
      DIGITS_CONST.each do |digit|
        assert_equal digit, (digit.scan Regexp.new DefaultSpec::DIGITS)[0]
      end
    end
  end

  class TestStructureSpec < Test::Unit::TestCase
    
    def test_load_specification_from_file
      spec = StructureSpec.instance
      spec.load_specification("test/TextData/data.yml")

      assert_equal 2, spec.level_count
      assert_equal "string01", spec.levels[1]
      assert_equal "string02", spec.levels[2]
    end
  end
end
