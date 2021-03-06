class PostsController < ApplicationController
    before_action :create_service
    before_action :set_post, only: [:edit, :update, :destroy, :show]

    def index
        @posts = @post_service.all
    end

    def show
    end

    def new
        @post = @post_service.new
    end

    def create
        @post = @post_service.new
        @post.publish_date = Time.now.to_i
        post_save
    end

    private

    def post_save
      post_assign_fields

        respond_to do |format|
          if @post.save
            format.html { redirect_to posts_path, notice: 'Registro Guardado Satisfactoriamente' }
            format.json { render :index, status: :created, location: @post }
          else
            format.html { render :new }
            format.json { render json: @post.errors, status: :unprocessable_entity }
          end
        end

    end

    def post_assign_fields
        @post.title       = params[:post][:title]
        @post.body        = params[:post][:body]
        @post.category_id = params[:post][:category_id]
    end

    def set_post
        @post = @post_service.find params[:id]

    rescue ActiveRecord::RecordNotFound
        flash[:error] = "El post no existe"
        redirect_to posts_path
    end

    def create_service
      @post_service = PostService.new
    end

end
