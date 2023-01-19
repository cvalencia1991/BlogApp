require 'rails_helper'
RSpec.describe User, type: :model do
  subject do
    User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                bio: 'Teacher from Mexico.', postscounter: 0)
  end
  before { subject.save }

  it 'name not be empty' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'name is not be empty' do
    expect(subject.name).to_not be_nil
  end

  it 'postcounter not have to be bigger than 0' do
    subject.postscounter = 'alfa'
    expect(subject).to_not be_valid
  end
end
