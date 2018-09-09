require 'rails_helper'

RSpec.describe API::V1::ProjectsController, type: :controller do
  let(:user) { create(:user) }
  let(:user_token) { Knock::AuthToken.new( payload: {sub: user.id}).token }

  context 'GET index' do
    it 'should return all projects' do
      4.times { create(:project) }
      get :index, format: :json
      parsed_response = JSON.parse(response.body)
      expect(parsed_response.size).to eq 4
    end
  end

  context 'GET show' do
    let(:project) { create(:project) }

    before do
      get :show, format: :json, params: { id: project.id }
    end

    it 'should return 200 response' do
      parsed_response  = JSON.parse(response.body)
      expect(parsed_response['id']).to be_eql project.id
    end

    it 'should return project with id' do
      expect(response).to be_success
    end

  end

  context 'PUT update' do
    let(:old_title) { 'Project A' }
    let(:new_title) { 'Project X' }
    let(:project) { create(:project, title: old_title) }

    before :each do
      request.headers['Authorization'] = "Bearer #{user_token}"
    end

    it 'should update project properties' do
      put :update, format: :json,  params: {id: project.id, project: {title: new_title} }
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['title']).to be_eql(new_title)
    end

    context 'Invalid record update' do
      it 'should throw record not found' do
        params = {id: 'unknown', project: {title: new_title} }

        expect {put :update, format: :json, params: params}.to raise_error ActiveRecord::RecordNotFound
      end
    end
  end

  context 'POST create' do
    before :each do
      request.headers['Authorization'] = "Bearer #{user_token}"
    end

    let(:params) { {project: {title: 'Project X'}} }

    it 'should create a project' do
      post :create, format: :json, params: params
      parsed_response = JSON.parse(response.body)
      expect(response).to be_success
      expect(parsed_response['id']).not_to be_nil
      expect(parsed_response['title']).to eql(params[:project][:title])
      expect(response).to have_http_status :created
    end
  end

  context 'DELETE destroy' do
    before :each do
      request.headers['Authorization'] = "Bearer #{user_token}"
    end

    let(:project) { create(:project) }

    it 'should delete a project' do
      delete :destroy, format: :json, params: { id: project.id }

      expect(response).to be_success
      expect { Project.find(project.id) }.to raise_error ActiveRecord::RecordNotFound
    end
  end
end
