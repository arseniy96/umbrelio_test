module Services
  class EvaluatePost

    def self.call(params)
      post = Post.find(params[:post_id])
      vote = params[:vote]

      ActiveRecord::Base.transaction do
        post.ratings.create(vote: vote)
      end

      post.ratings.average(:vote)
    end

  end
end