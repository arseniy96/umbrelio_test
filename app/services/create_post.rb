module Services
  class CreatePost
    include ActiveModel::Validations

    def self.call(user, params)
      @user = user
      @post = @user.posts.create(params.require(:post).permit(:title, :text, :user_ip))
    end

  end
end