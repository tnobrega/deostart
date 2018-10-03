class LeadsController < ApplicationController
  before_action :set_lead, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:create, :new]

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
        firebase = Firebase::Client.new(ENV['FIREBASE_URL'], ENV['FIREBASE_SECRET'])
        response = firebase.push("leads", { id: @lead.id, name: @lead.name, last_name: @lead.last_name, email: @lead.email, ip: @lead.ip, created_at: @lead.created_at.to_s })
        format.html { redirect_to content_path, notice: 'Parabéns, Esse é nosso conteúdo exclusivo.' }
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
      params.require(:lead).permit(:name, :last_name, :email, :ip)
    end
end
