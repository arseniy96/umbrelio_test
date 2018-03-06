require 'rails_helper'

describe Services::CreatePost do
  context 'when called with valid params' do
    let(:params) {{title: 'Title', text: 'Lorem ipsum', user_ip: '192.168.1.38', user_id: 1}}
    let! (:user) { create(:user) }

    it 'should create post' do
      expect(User.count).to eq(1)
      expect {described_class.call(user, params)}.to change(Post, :count).by(1)
    end
  end
end