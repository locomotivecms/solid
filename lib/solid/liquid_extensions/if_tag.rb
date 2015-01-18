module Solid
  module LiquidExtensions
    class IfTag < Liquid::Block

      include Solid::Element
      extend TagHighjacker

      tag_name :if

      def initialize(tag_name, expression, context = {})
        @blocks = []
        push_block!(expression)
        super
      end

      def render(context)
        attach_body_to_last_block

        with_context(context) do
          @blocks.each do |expression, body|
            if expression.evaluate(context)
              return body.render(context)
            end
          end
        end
        ''
      end

      def unknown_tag(tag, expression, tokens)
        if tag == 'elsif'
          push_block!(expression)
        elsif tag == 'else'
          push_block!('true')
        end
      end

      protected

      def push_block!(expression)
        attach_body_to_last_block

        @blocks.push([Solid::Parser.parse(expression), nil])
      end

      def attach_body_to_last_block
        # the @body always represents the nodelist of the previous expression
        if last_block = @blocks.last
          last_block[1] = @body.clone
          @body.instance_variable_set(:@nodelist, [])
        end
      end

    end
  end
end
