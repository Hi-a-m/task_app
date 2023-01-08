class PostsController < ApplicationController
    
    before_action :today_date

    def today_date
      @today_date = Time.zone.now.strftime("%Y年%m月%d日")
    end
      
      
    def index
      @posts = Post.all
      @post = Post.find_by(id: params[:id])
      @post_count = Post.all.count
    end
      
    def new
      @post = Post.new
    end
      
    def create
      @post = Post.new(post_params)
      if @post.save
        flash[:notice] = "スケジュールを登録しました"
        redirect_to posts_path
      else
        flash.now[:alert] = "スケジュールを登録できませんでした"
        render :new
      end
    end
        
    def show
      @post = Post.find(params[:id])
    end
      
    def edit
      @post = Post.find(params[:id])
    end
      
    def update
      @post = Post.find(params[:id])
      
      if @post.update(post_params)
        flash[:notice] = "スケジュールを更新しました"
        redirect_to post_path
      else
        flash.now[:alert] = "スケジュールを更新できませんでした"
        render :edit
      end
    end
      
    def destroy
      @post = Post.find(params[:id])
      @post.destroy
      flash[:notice] = "スケジュールを削除しました"
        redirect_to posts_path
    end
      
    private
      
    def post_params
      params.require(:post).permit(
        :title,
        :start_at,
        :end_at,
        :is_all_day,
        :memo
      )
    end
    
      
      
end

