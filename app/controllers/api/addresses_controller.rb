class Api::AddressesController < ApplicationController
  def create
    @address = Address.new(address_params)
    if @address.save
      render json: @address
    else
      render json: @address.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def address_params
    params.require[:address]
          .permit(:address1, :address2, :city, :state, :postal_code)
  end
end
