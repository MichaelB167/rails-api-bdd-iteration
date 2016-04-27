require 'rails_helper'

RSpec.describe Comment do

  def association
    described_class.reflect_on_association(:article)
  end

  it 'belongs to an article' do
    expect(association).to_not be_nil
    expect(association.name).to eq(:article)
  end

  it 'has a set inverse_of record' do
    expect(association.options[:inverse_of]).to_not be_nil
    expect(association.options[:inverse_of]).to eq(:comments)
  end

  it 'validates the presence of comment\'s content' do
    expect(Comment.create(content: 'Awesome Comment')).to be_valid
    expect(Comment.create).to be_invalid
  end
end
