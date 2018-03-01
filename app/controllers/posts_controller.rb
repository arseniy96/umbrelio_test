class PostsController < ApplicationController

  def create
    user = Services::CreateUser.call(params)

    if user.valid?
      post = Services::CreatePost.call(user, params)
      if post
        render json: post
      end
    end
  end

end