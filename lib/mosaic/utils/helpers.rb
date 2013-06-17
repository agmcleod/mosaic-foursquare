# Don't particularly want to require ActiveSupport for one method, so here's the implementation of it.
module Mosaic
  module Utils
    module Helpers
      def underscore_string(str)
        word = str.to_s.dup
        word.gsub!(/::/, '/')
        word.gsub!(/([A-Z\d]+)([A-Z][a-z])/,'\1_\2')
        word.gsub!(/([a-z\d])([A-Z])/,'\1_\2')
        word.tr!("-", "_")
        word.downcase!
        word
      end
    end
  end
end