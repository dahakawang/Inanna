# encoding: UTF-8
require 'rubygems'

module Inanna
  class EncodingNotDetectError < RuntimeError
  end

  class CharCodecIO
    SUPPORTED_ENCODINGS = %w(
      GBK
      UTF-8
      UTF-16
    )
    
    attr_reader :last_encoding

    def decodeFromFile(file)
      data = IO.read(file)

      raise EncodingNotDetectError, "Cannot detect character encodings" unless guessEncoding(data)

      data
    end

    def encodeToFile(file, data, encoding = "UTF-8")
      converted = data.encode(encoding, 
            {:invalid => :replace, 
              :undef => :replace, 
              :replace => '?'})

      IO.write(file, converted, encoding)
    end


    def guessEncoding(str)
      original = str.encoding

      SUPPORTED_ENCODINGS.each do |encoding|
        str.force_encoding(encoding)
        if str.valid_encoding?
          @last_encoding = encoding
          str.encode!("UTF-8", 
            {:invalid => :replace, 
              :undef => :replace, 
              :replace => '?'})
          return true
        end
      end

      str.force_encoding(original)
      return false
    end
  end
end
