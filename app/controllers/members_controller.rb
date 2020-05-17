class MembersController < ApplicationController
	before_action :authenticate_member!
	
	def show
		@member = Member.find(params[:id])
	end

	#退会処理：論理削除
	def hide
		@member = member.find(params[:id])
		#フラグを立てる false(退会)にアップデート
		@member.update(is_valid: false)
		#会員ログアウトさせる
		reset_session
		#ログアウト後、ルートパスに飛ばす
		redirect_to root_path
	end

	private
	def memeber_params
		params.require(:members).permit(:family_name, :frist_name, :family_name_kana, :frist_name_kana, :tel, :email, :postal_code, :address)
	end
end
