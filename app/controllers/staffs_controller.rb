class StaffsController < ApplicationController
	def create
  	staff = current_user.active_staffs.build(registered_id: params[:user_id])
    if staff.save
      flash[:notice] = "スタッフ登録しました"
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = "スタッフ登録できませんでした"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    staff = current_user.active_staffs.find_by(registered_id: params[:user_id])
    staff.destroy
    flash[:notice] = "スタッフを解除しました"
    redirect_back(fallback_location: root_path)
  end
end
