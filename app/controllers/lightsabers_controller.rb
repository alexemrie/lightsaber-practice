class LightsabersController < ApplicationController
  def index
    @lightsabers = Lightsaber.all
  end

  def show
    @lightsaber = Lightsaber.find(params[:id])
    @random_gif = Lightsaber.get_random_gif
  end

  def new
    @lightsaber = Lightsaber.new
  end

  def create
    @lightsaber = Lightsaber.new(lightsaber_params)

    if @lightsaber.save
      flash[:success] = "Jedi was successfully created"
      redirect_to lightsaber_path(@lightsaber)
    else
      render :new
    end
  end

  def edit
    @lightsaber = Lightsaber.find(params[:id])
  end

  def update
    @lightsaber = Lightsaber.find(params[:id])

    if @lightsaber.update(lightsaber_params)
      flash[:success] = "Jedi was successfully updated"
      redirect_to lightsaber_path(@lightsaber)
    else
      render :edit
    end
  end

  def destroy
    Lightsaber.destroy(params[:id])
    flash[:success] = "Jedi was successfully deleted"
    redirect_to lightsabers_path
  end


  private

  def lightsaber_params
    params.require(:lightsaber).permit(:name, :color)
  end

end
