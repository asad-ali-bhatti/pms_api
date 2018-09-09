require 'spec_helper'

RSpec.describe ProjectsController, type: :controller do
  context 'GET index' do
    it 'should return all projects' do
      4.times { create(:project) }
      get :index
      expect(response).to have_content([])
    end
  end
end