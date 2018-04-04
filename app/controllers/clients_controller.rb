class ClientsController < ApplicationController

  before_action :sign_in


  def index
    @clients = Client.all.to_a.sorted
    ## keep query in controller, not view
  end

  def show
    @client = Client.find(params[:id])
    @events = @client.events.all
    @prints = @client.prints.all
    @expenses = @client.expenses.not_nil
  end


  def client_expense()
    @client = Client.find(params[:id])
    total =[]
    @client.expenses.each do |e|
      total << e.amount
    end
    @total = total.sum


    respond_to do |format|
        format.pdf do
          render pdf: "client_expense"   # Excluding ".pdf" extension.
        end
      end

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
    params.require(:client).permit(:first_name, :last_name, :name, :billing_contact, :billing_company, :billing_address1, :billing_address2, :billing_phone, :billing_city, :billing_state, :billing_zip)
  end
end
