class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    # そのユーザ（@user）に関連付けられた投稿（.post_images）のみ、@post_imagesに渡す
    @post_images = @user.post_images.page(params[:page]).reverse_order
  end

  def edit
    # params[:id]でユーザの情報を取得してインスタンス（@user）に保存し、編集用Viewでform_withを使う準備
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

end
