require 'rails_helper'

RSpec.describe "Members", type: :request do
	let(:member) {create(:member)}
	let(:member_params) {attributes_for(:member)}
     before do
  	  visit new_member_session_path
  	  fill_in 'member[email]', with: member.email
  	  fill_in 'member[password]', with: member.password
  	  click_button 'ログイン'
     end
    describe '会員機能のテスト' do
    	context 'マイページのリンク' do
    		before do
    		   visit member_path(member)
    	    end
    	    it '情報入力画面へ遷移する' do
			   visit edit_member_path(member)
			   expect(current_path).to eq('/members/' + member.id.to_s + '/edit')
		    end
		    it '配送先一覧へ遷移する' do
			visit address_index_path
			expect(current_path).to eq('/address')
		    end
        end
    end
        context '登録情報編集画面のテスト' do
        	before do
        		visit edit_member_path(member)
        	end
        	it '名前編集フォームに自分の名前が表示される' do
        		expect(page).to have_field 'member[family_name]', with: member.family_name
        		expect(page).to have_field 'member[first_name]', with: member.first_name
        	end
        	it '編集内容が保存できる' do
        		click_button '編集内容を保存する'
        		expect(page).to have_http_status(:success)
        	end
        end


end
