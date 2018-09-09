require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'ActiveModel validations' do
    it { should validate_presence_of :title }
  end

  describe 'ActiveRecord Associations' do
    it { should belong_to :project }
  end
end
