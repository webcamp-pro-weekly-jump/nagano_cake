class Admins::MembersController < ApplicationController
	before_action :authenticate_admin!

	def index
		@members = Member.all
	end

	def show
		@member = Member.find(params[:id])
	end

	def edit
		@member = Member.find(params[:id])
	end

	def update
		@member = Member.find(params[:id])
		@member.update(member_params)
		redirect_to admins_members_path #仮です
	end

    private
	def member_params
		params.require(:member).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :postal_code, :address, :tel, :email, :is_valid)
	end
end
