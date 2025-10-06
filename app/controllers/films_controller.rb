class FilmsController < ApplicationController
  before_action :set_film, only: [:show, :edit, :update, :destroy]
  def index
    if params[:filter] == "vus"
      @films = Film.where(vu: true)
    elsif params[:filter] == "non_vus"
      @films = Film.where(vu: false)
    else
      @films = Film.all
    end
  end

  def new
    @film = Film.new
  end

  def show
  end

  def create
    @film = Film.new(film_params)
    if @film.save
      redirect_to films_path, notice: "Votre Film à été Ajouté Avec Succes !!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @film.update(film_params)
      redirect_to films_path, notice: "Votre Film à été Mis à Jour Avec Succes !!"
    else
      render :edit
    end
  end

  def destroy
    @film.destroy
    redirect_to films_path, notice: "Votre FIlm à été Supprimé Avec Succes !!"
  end

  private

  def set_film
    @film = Film.find(params[:id])
  end

  def film_params
    params.require(:film).permit(:titre, :annee, :vu)
  end

end