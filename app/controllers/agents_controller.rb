class AgentsController < ApplicationController
  # before_action :agent

  def index
    @agents = Agent.all
  end

  def new
    @agent = Agent.new
  end

  def create
    @agent = Agent.new(agent_params)
    if @agent.save
      redirect_to agents_path
    else
      render :new
    end
  end

  def show
    @agent = Agent.find(params[:id])
  end

  def edit
    @agent = Agent.find(params[:id])
  end

  def update
    @agent = Agent.find(params[:id])
    if @agent.update(agent_params)
      redirect_to
    else
      render :edit
    end
  end
  


  private

    def agent_params
      params.require(:agent).permit(:name, :phone, :email)
    end

    # def agent
    #   @agent = Agent.find(params[:id])
    # end
end
