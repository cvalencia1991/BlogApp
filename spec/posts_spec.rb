require 'rails_helper'
RSpec.describe Post, type: :model do
  subject do
    Post.create(id: 11, authorid: 3, title: 'Hello', text: 'This is my first post',
                commentscounter: 1, likescounter: 1)
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
    expect(subject.commentscounter).to_not be_nil
  end

  it 'Likecounter greather than 0' do
    subject.likescounter = 'alfa'
    expect(subject).to_not be_valid
  end
end
