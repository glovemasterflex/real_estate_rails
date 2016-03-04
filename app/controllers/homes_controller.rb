class HomesController < ApplicationController
	before_action :agent, :home, only: [:show, :edit, :update, :destroy]

  def index
  	@homes = @agent.homes.all
  end

  def show
  	@home = Home.find(params[:id])
  end

  def edit
  end

  def update
  	if @home.update(home_params)
  		redirect_to agent_home_path(@agent, @home)
  	else
  		render :edit
  	end
  end

  def new
  end

  def create
  	@home = @agent.home.new(home_params)
  	if @home.save
  		redirect_to agent_home_path(@agent)
  	else
  		render :new
  	end
  end

  def destroy
  	@home.destroy
  	redirect_to agent_homes_path(@agent)
  end

  private
  	def home_params
  		params.require(:home).permit(:bed, :bath, :sqft, :price, :sold, :like)
  	end

  	def agent
  		@agent = Agent.find(params[:agent_id])
  	end

  	def home
  		@agent.homes.find(params[:id])
  	end
end
