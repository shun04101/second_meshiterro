class PostImagesController < ApplicationController

  # 画像投稿画面
  def new
    @post_image = PostImage.new

  end

  # 投稿データの保存
  def create
    @post_image = PostImage.new(post_image_params)
    # current_userはdeviseのヘルパーメソッド
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to post_images_path

  end

  # 投稿一覧画面
  def index
    @post_images = PostImage.all

  end

  # 投稿画像詳細画面
  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new

  end

  # 投稿削除
  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to post_images_path

  end

  # 投稿データのストロングパラメータ
  private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end

end
