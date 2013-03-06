# encoding: UTF-8
require 'singleton'
require 'yaml'
require 'support'

module Inanna
  # This class defines the default structure specification
  class DefaultSpec
    include Singleton

    # TODO bug fix : "sdfas卷adsfa" will be matched?
    DIGITS = '\d+|[０１２３４５６７８９]+|[一两兩二三四五六七八九壹贰叁肆伍陆柒捌玖]?[万萬]?零?[一两兩二三四五六七八九壹贰叁肆伍陆柒捌玖]?[千仟]?零?[一两兩二三四五六七八九壹贰叁肆伍陆柒捌玖]?[百佰]?零?[一二三四五六七八九壹贰叁肆伍陆柒捌玖]?[十拾]?零?[零一二三四五六七八九壹贰叁肆伍陆柒捌玖]?'

    DEFAULT_SPEC = 
    <<-eos
    :level_count: 2
    :levels:
      1: (第+(#{DIGITS})卷)
      2: (第+(#{DIGITS})[章节])
    eos

    def get_default_spec
      return DEFAULT_SPEC
    end
  end

  class StructureSpec
    include Singleton
    
    attr_reader :level_count
    attr_reader :levels
    attr_reader :paragraph_level
    attr_reader :top_level

    def load_specification(filePath = nil)
      if filePath
        spec_str = File.read(filePath)
      else
        spec_str = DefaultSpec.instance.get_default_spec
      end

      spec = YAML.load(spec_str)
      @level_count = spec[:level_count]
      @levels = spec[:levels]
      @paragraph_level = @level_count + 1
      @top_level = 0
    end
  end
end