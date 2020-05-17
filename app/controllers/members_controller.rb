class MembersController < ApplicationController
	before_action :authenticate_member!
	def show
		@member = Member.find(params[:id])
	end

	private
	def memeber_params
		params.require(:members).permit(:family_name, :frist_name, :family_name_kana, :frist_name_kana, :tel, :email, :postal_code, :address)
	end
end
