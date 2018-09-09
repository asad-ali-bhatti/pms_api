require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'ActiveModel validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :description }
  end

  describe 'ActiveRecord Associations' do
    it { should have_many :tasks }
  end
end
