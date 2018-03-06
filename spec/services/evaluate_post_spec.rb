require 'rails_helper'

describe Services::EvaluatePost do
  context 'when called' do
    let!(:user) { create(:user) }
    let!(:post) { create(:post, user: user) }
    let(:params) { {post_id: Post.last.id, vote: 5} }

    it 'should return average rating' do
      expect(User.count).to eq(1)
      expect(Post.count).to eq(1)
      expect(described_class.call(params)).to eq(5)
    end
  end
end