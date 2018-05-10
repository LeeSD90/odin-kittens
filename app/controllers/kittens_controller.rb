class KittensController < ApplicationController
  before_action :set_kitten, only: [:show, :edit, :update, :destroy]

  # GET /kittens
  # GET /kittens.json
  def index
    @kittens = Kitten.all
  end

  # GET /kittens/1
  # GET /kittens/1.json
  def show
    @kitten = Kitten.find(params[:id])
  end

  # GET /kittens/new
  def new
    @kitten = Kitten.new
  end

  # GET /kittens/1/edit
  def edit
  end

  # POST /kittens
  # POST /kittens.json
  def create
    @kitten = Kitten.new(kitten_params)

    respond_to do |format|
      if @kitten.save
        flash[:success] = "Kitten was successfully created."
        format.html { redirect_to @kitten }
        format.json { render :show, status: :created, location: @kitten }
      else
        format.html { render :new }
        format.json { render json: @kitten.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kittens/1
  # PATCH/PUT /kittens/1.json
  def update
    respond_to do |format|
      if @kitten.update(kitten_params)
        flash[:notice] = 'Kitten was successfully updated.'
        format.html { redirect_to @kitten }
        format.json { render :show, status: :ok, location: @kitten }
      else
        format.html { render :edit }
        format.json { render json: @kitten.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kittens/1
  # DELETE /kittens/1.json
  def destroy
    @kitten.destroy
    respond_to do |format|
      flash[:notice] = 'Kitten was successfully destroyed.'
      format.html { redirect_to kittens_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kitten
      @kitten = Kitten.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def kitten_params
      params.require(:kitten).permit(:name, :age, :cuteness, :softness)
    end
end
