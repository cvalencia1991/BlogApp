require 'rails_helper'
RSpec.describe Comment, type: :model do
  subject { Comment.create(authorid: 3, postid: 9, text: 'Hi Tom!') }
  before { subject.save }

  it 'Postid not to be strings' do
    subject.postid = 'alfa'
    expect(subject).to_not be_valid
  end

  it 'Postid not to be strings' do
    expect(subject.postid).to_not be_nil
  end
end
