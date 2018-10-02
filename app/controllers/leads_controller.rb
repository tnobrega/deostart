class LeadsController < ApplicationController
  before_action :set_lead, only: [:show, :edit, :update, :destroy]

  # GET /leads
  # GET /leads.json
  def index
    @leads = Lead.all
  end

  # GET /leads/1
  # GET /leads/1.json
  def show
  end

  # GET /leads/new
  def new
    @lead = Lead.new
  end


  # POST /leads
  # POST /leads.json
  def create
    @lead = Lead.new(lead_params)
    @lead.ip = request.remote_ip
    respond_to do |format|
      if @lead.save
        format.html { redirect_to root_path, notice: 'Você foi cadastrado com sucesso.' }
      else
        format.html { render :new }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lead
      @lead = Lead.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lead_params
      params.require(:lead).permit(:name, :email, :ip)
    end
end
