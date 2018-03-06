require 'rails_helper'

describe Services::CreateUser do

  context 'when called with valid params' do
    let(:params) {{login: 'a@b.com'}}
    it 'should create user' do
      expect {described_class.call(params)}.to change(User, :count).by(1)
    end
  end

  context 'when called with invalid params' do
    let(:params) {{login: ''}}
    it 'should return error' do
      expect {described_class.call(params)}.to change(User, :count).by(0)
    end
  end

end