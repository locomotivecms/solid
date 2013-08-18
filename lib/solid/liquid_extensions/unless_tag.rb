module Solid
  module LiquidExtensions
    class UnlessTag < Solid::LiquidExtensions::IfTag

      tag_name :unless

      def initialize(tag_name, expression, tokens, context = {})
        super(tag_name, "!(#{expression})", tokens, context)
      end

    end
  end
end
