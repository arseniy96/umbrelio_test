class PostsController < ApplicationController

  def create
    params_user_hash = params.require(:user).permit(:login).to_h
    params_post_hash = params.require(:post).permit(:title, :text, :user_ip).to_h

    user = Services::CreateUser.call(params_user_hash)

    if user.valid?
      post = Services::CreatePost.call(user, params_post_hash)
      if post.valid?
        render json: post, status: 200
      else
        render json: post.errors.full_messages, status: 422
      end
    else
      render json: user.errors.full_messages, status: 422
    end
  end

  def rate
    post = Post.find(params[:post_id])
    vote = params[:vote]

    ActiveRecord::Base.transaction do
      post.ratings.create(vote: vote)
    end
    render json: post.ratings.average(:vote), status: 200
  end

  def top
    @posts = Post.top(10)
    render json: @posts.select(:id, :title, :text), status: 200
  end

  def uniq_ip
    ips = Services::GroupByUserIp.call
    render json: ips.as_json, status: 200
  end

end

