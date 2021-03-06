# encoding: UTF-8
require 'rubygems'

module Inanna
  class EncodingNotDetectError < RuntimeError
  end

  class CharCodecIO
    SUPPORTED_ENCODINGS = {
      'UTF-8' => "\xEF\xBB\xBF".force_encoding("ASCII-8BIT"),
      'UTF-16LE' => "\xFF\xFE".force_encoding("ASCII-8BIT"),
      'UTF-16BE' => "\xFE\xFF".force_encoding("ASCII-8BIT"),
    }
    
    attr_reader :last_encoding

    def initialize
      @specified_enc = nil
    end

    def decode_from_file(file)
      data = IO.binread(file)

      # guess the encoding
      guessed = guess_encoding(data)
      raise EncodingNotDetectError, "Cannot detect character encodings" if guessed == "UNKNOWN"

      # convert to utf8 
      @last_encoding = guessed
      data = strip_signature(data, guessed)
      data.force_encoding(guessed)
      data.encode!("UTF-8", {:invalid => :replace, :undef => :replace, :replace => '?'})

      data
    end

    def encode_to_file(file, data, encoding = "UTF-8")
      converted = data.encode(encoding, 
            {:invalid => :replace, 
              :undef => :replace, 
              :replace => '?'})

      File.write(file, converted)
    end

    def specify_encoding(encoding)
      @specified_enc = encoding
    end

    def guess_encoding(str)
      return @specified_enc if @specified_enc

      str.force_encoding("ASCII-8BIT")
      SUPPORTED_ENCODINGS.each do |key, value|
        if str.start_with? value
          return key
        end
      end

      return "GBK" if str.force_encoding("GBK").valid_encoding?

      "UNKNOWN"
    end

    def strip_signature(str, encoding)
      signature = SUPPORTED_ENCODINGS[encoding]
      if signature
        return str[(signature.length)..(str.length - 1)]
      end

      str
    end
  end
end