class Api::AddressesController < ApplicationController
  def create
    @address = Address.where(address_params).first_or_create
    if @address && @address.errors.full_messages.empty?
      render json: @address
    else
      render json: @address.errors.full_messages, status: :unprocessable_entity
    end
  end

  def index
    @addresses = Address.all
    render :index
  end

  private

  def address_params
    params.require(:address)
          .permit(:address1, :address2, :city, :state, :postal_code)
  end
end
