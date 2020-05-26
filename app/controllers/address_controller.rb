class AddressController < ApplicationController
  
  def index
  	@addresses = current_member.addresses
  	@address = Address.new

  end

  def create
  	@address = Address.new(address_params)
  	@address.member_id = current_member.id
  	if @address.save
  		redirect_to address_index_path
  	else
       render"index"
    end
  end

  def edit
  	@address = Address.find(params[:id])

  end

  def update
    @address = Address.find(params[:id])
     if @address.update(address_params)
        redirect_to address_index_path
     else
     	render"edit"
     end
     	
  end

  def destroy
  	@address = Address.find(params[:id])
  	@address.destroy
  	redirect_to address_index_path

  end


private

  def address_params
    params.require(:address).permit(:name, :pastal_code, :address)
  end

end
