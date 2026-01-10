class TagsController < ApplicationController
  before_action :enable_sidebar
  
  def index
    @tags = current_user.tags
  end

  def new
    @tag = Tag.new
  end

  def create
    tag = Tag.new(tag_params)
    tag.user_id = current_user.id
    if tag.save
      redirect_to tags_path
    else
      render :new, status: :unprocessable_entity 
    end
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update(tag_params)
      redirect_to tags_path, notice: "タグを更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end
    
  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to tags_path, notice: "タグを削除しました"
  end  

  private
  def tag_params
    params.require(:tag).permit(:tagname)
  end
end
