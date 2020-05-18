class MembersController < ApplicationController
	before_action :authenticate_member!
	
	#会員詳細
	def show
		@member = Member.find(params[:id])
	end

	#会員情報編集
	def edit
		@member = Member.find(current_member.id)
	end

	def update
		@member = Member.find(params[:id])
		if @member.update(member_params)
           flash[:update] = "登録情報を更新しました"
  	       redirect_to member_path(@member.id) #仮で設定：修正の可能性あり
        else
           render :edit
        end
	end

	#退会処理：論理削除
	def quit
		
	end
	def hide
		@member = member.find(params[:id])
		#フラグを立てる false(退会)にアップデート
		@member.update(is_valid: false)
		#会員ログアウトさせる
		reset_session
		#ログアウト後、ルートパスに飛ばす
		flash[:notice] = "ありがとうございました。またのご利用をお待ちしております。"
		redirect_to root_path
	end

	private
	def memeber_params
		params.require(:members).permit(:family_name, :frist_name, :family_name_kana, :frist_name_kana, :tel, :email, :postal_code, :address)
	end
end
