class Solid::Block < Liquid::Block

  include Solid::Element
  include Solid::Arguments
  
  def render(context)
    with_context(context) do
      display(*arguments.interpolate(context)) do
        super
      end
    end
  end

end
