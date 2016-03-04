class AddressesController < ApplicationController

  before_action :a_agent
  before_action :b_home
  before_action :c_address, only: [:show, :edit, :update, :destroy]


  def index
  end

  def show
  end

  def new
    @address = Adress.new
  end

  def create
    @address = @location.address.new(address_params)
    if @address.save
      redirect_to agent_home_address_path(@agent, @home, @address)
  end

  def edit
  end

  def update
    if @address.update(address_params)
      redirect_to agent_home_adress_path(@agent, @home, @address)
    else
      render :edit
  end

  def destroy
    @address.destroy
    redirect_to agent_home_path(@agent, @home)
  end

  private
  def adress_params
    params.require(:address).permit(:street, :city, :state, :zip)
  end

  def a_agent
    @agent = Agent.find(params[:agent_id])
  end

  def b_home
    @home = @agent.home.find(params[:home_id])
  end

  def c_address
    @address = @home.address.find(params[:id])
  end

end
