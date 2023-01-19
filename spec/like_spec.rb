require 'rails_helper'
RSpec.describe Like, type: :model do
  subject { Like.create(authorid: 3, postid: 5) }
  before { subject.save }

  it 'authorid not be 0' do
    subject.postid = 1
    expect(subject).to_not be_nil
  end
end
