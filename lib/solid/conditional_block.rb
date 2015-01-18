class Solid::ConditionalBlock < Liquid::Block

  include Solid::Element

  def render(context)
    with_context(context) do
      display(*arguments.interpolate(context)) do |condition_satisfied|
        render_with_condition(condition_satisfied, context)
      end
    end
  end

  def render_with_condition(condition_satisfied, context)
    _body = nil

    if condition_satisfied
      _body = @condition_satisfied_body
    else
      return '' if @condition_satisfied_body.nil?
    end

    (_body || @body).render(context)
  end

  def unknown_tag(tag, markup, tokens)
    if tag == 'else'
      @condition_satisfied_body = @body.clone
      @body.instance_variable_set(:@nodelist, [])
    else
      super
    end
  end

end
