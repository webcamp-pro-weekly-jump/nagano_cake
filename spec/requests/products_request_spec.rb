require 'rails_helper'

RSpec.describe "Products", type: :request do
  let(:product){create(:product)}
  let(:member){create(:member)}
  let(:member_params) {attributes_for(:member)}
   before do
    visit new_member_session_path
    fill_in 'member[email]', with: member.email
    fill_in 'member[password]', with: member.password
    click_button 'ログイン'
  end
	describe '商品一覧画面のテスト' do
		context '表示の確認' do
 	      before do
 		   visit products_path
 	      end
  	      it '商品詳細画面に遷移する' do
  	       visit product_path(product)
  	    	 expect(current_path).to eq('/products/' + product.id.to_s )
  	      end
  	    end
    end

    describe '商品詳細画面のテスト' do
    	context 'カート画面に遷移する' do
 	     before do
 	     	visit product_path(product)
 	     end
 	     it 'カート画面へのリンク' do
        visit cart_items_path
 	     	expect(current_path).to eq('/cart_items')
 	     end
    	end
    end
end
