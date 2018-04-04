class Admin::ClientsController < ApplicationController
  def index
    @clients = Client.all.sorted
    ## keep query in controller, not view
  end

  def show
    @client = Client.find(params[:id])
  end

  def new
    @client = Client.new
  end

  def create
    @clients = Client.all.to_a
    @client = Client.create(client_params)
  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
    @clients = Client.all.to_a
    @client = Client.find(params[:id])

    @client.update_attributes(client_params)
  end

  def delete
    @client = Client.find(params[:client_id])
  end

  def destroy
    @clients = Client.all.to_a
    @client = Client.find(params[:id])
    @client.destroy
  end

  private

  def client_params
    params.require(:client).permit(:first_name, :last_name, :name)
  end
end
