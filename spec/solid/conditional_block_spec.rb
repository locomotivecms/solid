require 'spec_helper'

class IfPresent < Solid::ConditionalBlock

  tag_name :ifpresent

  def display(string)
    yield(!string.strip.empty?)
  end

end

describe Solid::ConditionalBlock do

  it_behaves_like "a Solid element"

  describe '#display' do

    let(:template) { "{% ifpresent mystring %}present{% else %}blank{% endifpresent %}"}

    subject { Liquid::Template.parse(template) }

    it 'yielding true should render the main block' do
      context = Liquid::Context.new('mystring' => 'blah')
      subject.render(context).should be == 'present'
    end

    it 'yielding false should render the `else` block' do
      context = Liquid::Context.new('mystring' => '')
      subject.render(context).should be == 'blank'
    end

    context 'without a `else` block' do

      let(:template) { "{% ifpresent mystring %}present{% endifpresent %}"}

      it 'yielding false should not render anything' do
        context = Liquid::Context.new('mystring' => '')
        subject.render(context).should be == ''
      end

    end

  end

end
