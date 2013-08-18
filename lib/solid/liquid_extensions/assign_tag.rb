module Solid
  module LiquidExtensions
    class AssignTag < Solid::Tag
      extend TagHighjacker

      tag_name :assign

      def initialize(tag_name, assignment, tokens, context = {})
        @assigned_variable, expression = assignment.split('=', 2)
        @assigned_variable = @assigned_variable.strip
        super(tag_name, expression, tokens, context)
      end

      def display(expression_result)
        current_context.scopes.last[@assigned_variable] = expression_result
        ''
      end

    end
  end
end
