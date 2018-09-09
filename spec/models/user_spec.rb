require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ActiveModel validations' do
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :password }
  end
  describe 'AcriveRecord Associations' do
    it { should have_many :comments }
  end
end
