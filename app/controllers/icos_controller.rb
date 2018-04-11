class IcosController < ApplicationController
  before_action :set_ico, only: [:show, :edit, :update, :destroy]

  # GET /icos
  # GET /icos.json
  def index
    @icos = Ico.new
    @ico = Ico.all 

    @q = Ico.ransack(params[:q])
    @re = @q.result


    #search bar function
    @rsearch = Ico.all

    if params[:search]
      @rsearch = Ico.search(params[:search])
    else 
      @rsearch = Ico.search(params[:search])
    end


  end

  def show

  end


  def new
    @ico = Ico.new
  end


  def edit
  end

  def info
    @icos = Ico.all
    @result = Ico.find(params[:id])
  end


  def create
    @ico = Ico.new(ico_params)

    respond_to do |format|
      #if Ico.exists?(website: @ico.website) == false
      if @ico.status != "Approved"
        @ico.status = "Pending"
        @ico.date_submitted = Time.now
        @ico.admin_approved = "False"
        @ico.save
        format.html { redirect_to @ico}
        format.json { render :show, status: :created, location: @ico }
      else
        format.html { redirect_to @ico }
        format.json { render :index, location: @ico}
      end
    end
  end

  # PATCH/PUT /icos/1
  # PATCH/PUT /icos/1.json
  def update #When approve or edit request
    @icos = Ico.all
    respond_to do |format|
      if @ico.update(ico_params)
        @ico.status = "Approved"
        @ico.date_approved = Time.now
        @ico.admin_approved = "True"

        @ico.save

        @icos.each do |i|
          if i.website == @ico.website and i.status == "Pending"
            i.destroy
          end
        end

        format.html { redirect_to user_pending_path, notice: 'Request approved.' }
      else
        format.html { render :edit }
      end
    end
  end


  def destroy #When reject request
    @icos = Ico.all

      @icos.each do |i|
        if i.website == @ico.website 
          i.destroy
        end
      end
    respond_to do |format|
      format.html { redirect_to user_pending_path, notice: 'Request destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ico
      @ico = Ico.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ico_params
      params.require(:ico).permit(:email, :ico_name, :symbol, :website, :whitepaper, :country, :description, :reason, :release_date, :status, :ranking, :date_submitted, :date_approved, :admin_approved)
    end
end
