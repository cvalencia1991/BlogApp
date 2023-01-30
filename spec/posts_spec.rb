require 'rails_helper'
RSpec.describe Post, type: :model do
  subject do
    Post.create(id: 11, author_id: 3, title: 'Hello', text: 'This is my first post',
                comments_counter: 1, likes_counter: 1)
  end
  before { subject.save }

  it 'name not be empty' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'has a valid title' do
    expect(subject.title).to be_a(String)
    expect(subject.title.length).to be <= 250
  end

  it 'Post counter be greater than 0' do
    expect(subject.comments_counter).to_not be_nil
  end

  it 'Likecounter greather than 0' do
    subject.likes_counter = 'alfa'
    expect(subject).to_not be_valid
  end
end
