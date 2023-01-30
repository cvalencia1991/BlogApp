require 'rails_helper'
RSpec.describe Like, type: :model do
  subject { Like.create(author_id: 3, post_id: 5) }
  before { subject.save }

  it 'authorid not be 0' do
    subject.post_id = 1
    expect(subject).to_not be_nil
  end
end
