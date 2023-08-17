require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.create(name: 'Lugard', email: 'lugard@lion.com', password: '123456')
  end

  before { subject.save }

  it 'should have a user name' do
    expect(subject.name).to eql 'Lugard'
  end

  it 'should have an email' do
    expect(subject.email).to be_present
  end

  it 'should have a password' do
    expect(subject.password).to eql '123456'
  end
end