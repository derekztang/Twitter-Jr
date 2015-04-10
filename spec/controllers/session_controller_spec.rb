require 'spec_helper'

describe 'sessions controller' do

  describe 'GET /sessions/new' do
    it 'should render the sign in form' do
      get '/sessions/new'
      expect(last_response.body).to include 'action="/sessions/new"'
    end
  end

  describe 'POST /sessions/new' do
    before do
      User.create!(username: 'testuser', password: 'horse')
    end
    context 'when given invalid params' do
      it 'should render the sign in form' do
        post '/sessions/new', username: 'badname', password: 'wrongpass'
        expect(last_response.status).to eq 401
        expect(last_response.body).to include 'Sign In</button>'
        expect(last_response.body).to include 'badname'
      end
    end
    context 'when given valid params' do
      it 'should sign me in and redirect to the homepage' do
        post '/sessions/new', username: 'testuser', password: 'horse'
        expect(last_response.status).to eq 302
        expect(last_response.location).to eq 'http://example.org/'
      end
    end
  end

end
