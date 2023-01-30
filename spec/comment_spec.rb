require 'rails_helper'
RSpec.describe Comment, type: :model do
  subject { Comment.create(author_id: 3, post_id: 9, text: 'Hi Tom!') }
  before { subject.save }

  it 'Postid not to be strings' do
    subject.post_id = 'alfa'
    expect(subject).to_not be_valid
  end

  it 'Postid not to be strings' do
    expect(subject.post_id).to_not be_nil
  end
end
