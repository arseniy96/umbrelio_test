require 'rails_helper'

describe Services::CreateUser do

  context 'when called with valid params' do
    let(:params) {{user: {login: 'a@b.com'}}}
    it 'should create user' do
      expect {described_class.call(params[:user])}.to change(User, :count).by(1)
    end
  end

  context 'when called with invalid params' do
    let(:params) {{user: {login: ''}}}
    it 'should return error' do
      expect {described_class.call(params[:user])}.to change(User, :count).by(0)
    end
  end

end