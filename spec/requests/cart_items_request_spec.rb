require 'rails_helper'

RSpec.describe "CartItems", type: :request do
	let(:product) {create(:product)}
	let(:member) {create(:member)}
	let(:member_params) {attributes_for(:member)}
   before do
  	visit new_member_session_path
  	fill_in 'member[email]', with: member.email
  	fill_in 'member[password]', with: member.password
  	click_button 'ログイン'
  end
	describe 'カート画面' do
		context '情報入力画面への遷移' do
			before do
				visit cart_items_path
			end
		it '情報入力画面への遷移' do
			   visit new_order_path
			   expect(current_path).to eq('/orders/new')
        end
		end
	end

end
