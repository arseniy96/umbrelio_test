module Services
  class CreatePost
    include ActiveModel::Validations

    def self.call(user, params)
      user = user
      post = user.posts.create(params)
    end

  end
end