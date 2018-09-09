require 'rails_helper'

RSpec.describe API::V1::ProjectsController, type: :controller do
  context 'GET index' do
    it 'should return all projects' do
      4.times { create(:project) }
      get :index, format: :json
      parsed_response = JSON.parse(response.body)
      expect(parsed_response.size).to eq 0
    end
  end
end