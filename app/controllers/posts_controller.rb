class PostsController < ApplicationController

  def create
    params_user_hash = params.require(:user).permit(:login).to_h
    params_post_hash = params.require(:post).permit(:title, :text, :user_ip).to_h

    user = Services::CreateUser.call(params_user_hash)

    if user.valid?
      post = Services::CreatePost.call(user, params_post_hash)
      if post.valid?
        render json: post
      else
        render json: post.errors.full_messages
      end
    else
      render json: user.errors.full_messages
    end
  end

  def rate
    post = Post.find(params[:post_id])
    vote = params[:vote]

    ActiveRecord::Base.transaction do
      post.ratings.create(vote: vote)
    end
    render json: post.ratings.average(:vote)
  end

  def top
    @posts = Post.top(1)
    render json: @posts.select(:id, :title, :text)
  end

  def uniq_ip
    hh = {}
    ips = Post.pluck(:user_ip).uniq
    ips.each {|ip| hh[ip] = Post.pluck(:user_id).uniq}
    render json: hh.as_json
  end

end

