class Member::SearchesController < ApplicationController
before_action :authenticate_user!,except: [:search]
  def search
    @range = params[:range]

    if @range == "User"
      @users = User.looks(params[:search], params[:word]).page(params[:page])
    else
      @posts = Post.looks(params[:search], params[:word]).page(params[:page])
    end
  end
end
