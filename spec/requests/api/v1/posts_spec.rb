require 'rails_helper'

RSpec.describe 'Posts API', type: :request do
  let(:user) { create(:user) }
  let!(:posts) { create_list(:post, 10, created_by: user.id) }
  let(:post_id) { posts.first.id }
  let(:headers) { valid_headers }

  describe 'GET /posts' do
    before { get api_v1_posts_path, params: {}, headers: headers }

    it 'returns posts' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /posts/:id' do
    before { get api_v1_post_path(post_id), params: {}, headers: headers }

    context 'when the record exists' do
      it 'returns the post' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(post_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:post_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

  describe 'POST /posts' do
    let(:valid_attributes) do
        { title: 'Learn Elm', content: 'Learn how to do things faster.', created_by: user.id.to_s }.to_json
    end

    context 'when the request is valid' do
      before { post api_v1_posts_path, params: valid_attributes, headers: headers }

      it 'creates a post' do
        expect(json['title']).to eq('Learn Elm')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      let(:invalid_attributes) { { title: nil }.to_json }
      before { post api_v1_posts_path, params: invalid_attributes, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'PUT /posts/:id' do
    let(:valid_attributes) { { title: 'My Weekend' }.to_json }

    context 'when the record exists' do
      before { put api_v1_post_path(post_id), params: valid_attributes, headers: headers }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /posts/:id' do
    before { delete api_v1_post_path(post_id), params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
