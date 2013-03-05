# encoding: UTF-8
require 'singleton'

module Inanna
  module Support
    def self.ensure_utf8(text)
      raise RuntimeError, "Only accept UTF-8 text for internal process." unless text.encoding.name == "UTF-8"
    end
  end
end