class Api::AddressesController < ApplicationController
  def self.find_or_create_by(params)
    address = Address.where(address1: params[:address1],
                            address2: params[:address2],
                            city: params[:city],
                            state: params[:state],
                            postal_code: params[:state])

    address.nil? ? Address.new(params) : address
  end

  def create
    @address = Address.find_or_create_by(address_params)
    if @address.persisted? || @address.save
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
