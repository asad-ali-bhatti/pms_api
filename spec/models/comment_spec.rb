require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'ActiveModel Validations' do
    it { should validate_presence_of :body }
  end

  describe 'ActiveRecord Associations' do
    it { should belong_to :user }
  end
end
