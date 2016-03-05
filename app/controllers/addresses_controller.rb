class AddressesController < ApplicationController

  before_action :a_agent
  before_action :b_home
  before_action :c_address, only: [:show, :edit, :update, :destroy]


  def index
    @address = @home.address
  end

  def show
  end

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @address.home = @home
    if @address.save
      redirect_to agent_home_addresses_path(@agent, @home, @address)
    end
  end

  def edit
  end

  def update
    if @address.update(address_params)
      redirect_to agent_home_addresses_path(@agent, @home, @address)
    else
      render :edit
    end
  end

  def destroy
    @address.destroy
    redirect_to agent_home_path(@agent, @home)
  end

  private
  def address_params
    params.require(:address).permit(:street, :city, :state, :zip)
  end

  def a_agent
    @agent = Agent.find(params[:agent_id])
  end

  def b_home
    @home = @agent.homes.find(params[:home_id])
  end

  def c_address
    @address = @home.address
  end

end
