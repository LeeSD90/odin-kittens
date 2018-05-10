class KittensController < ApplicationController
  before_action :set_kitten, only: [:show, :edit, :update, :destroy]

  def index
    @kittens = Kitten.all
    respond_to do |format|
      format.html
      format.json { render :json => @kittens }
    end
  end

  def show
    @kitten = Kitten.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render :json => @kitten }
    end
  end

  def new
    @kitten = Kitten.new
  end

  def edit
  end

  def create
    @kitten = Kitten.new(kitten_params)

    respond_to do |format|
      if @kitten.save
        flash[:success] = "Kitten was successfully created."
        redirect_to @kitten
      else
        flash[:error] = "Whoops couldnt create that kitten"
        render :new 
      end
    end
  end

  def update
    respond_to do |format|
      if @kitten.update(kitten_params)
        flash[:notice] = 'Kitten was successfully updated.'
        redirect_to @kitten
      else
        flash[:error] = "Whoops couldn't update that kitten."
        render :edit 
      end
    end
  end

  def destroy
    @kitten.destroy
    respond_to do |format|
      flash[:notice] = 'Kitten was successfully destroyed.'
      redirect_to kittens_url
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
