class EncuestaArticulosController < ApplicationController
  before_action :set_encuesta_articulo, only: [:show, :edit, :update, :destroy]
  before_action :set_article



  # GET /encuesta_articulos
  # GET /encuesta_articulos.json
  def index
    @encuesta_articulos = EncuestaArticulo.all
  end

  # GET /encuesta_articulos/1
  # GET /encuesta_articulos/1.json
  def show
  end

  # GET /encuesta_articulos/new
  def new
    @encuesta_articulo = EncuestaArticulo.new
  end

  # GET /encuesta_articulos/1/edit
  def edit
  end

  # POST /encuesta_articulos
  # POST /encuesta_articulos.json
  def create

    puts params[:valor]
    puts params[:articulo_id]
    valor=params[:valor]
    @EncuestaArticulo=EncuestaArticulo.find(params[:articulo_id])
    

    if valor=="poco_util"
    @EncuestaArticulo.poco_util += 1
    end
   if valor=="regular"
    @EncuestaArticulo.regular += 1
    end
  if valor=="interesante"
    @EncuestaArticulo.interesante += 1
    end
  if valor=="bueno"
    @EncuestaArticulo.bueno += 1
    end
  if valor=="excelente"
    @EncuestaArticulo.excelente += 1
    end



    @EncuestaArticulo.save
    redirect_to @articulo

    end

  # PATCH/PUT /encuesta_articulos/1
  # PATCH/PUT /encuesta_articulos/1.json
  def update

    respond_to do |format|
      if @encuesta_articulo.update(encuesta_articulo_params)
        format.html { redirect_to @articulo, notice: 'Encuesta articulo was successfully updated.' }
        format.json { render :show, status: :ok, location: @articulo }
      else
        format.html { render :edit }
        format.json { render json: @articulo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /encuesta_articulos/1
  # DELETE /encuesta_articulos/1.json
  def destroy
    @encuesta_articulo.destroy
    respond_to do |format|
      format.html { redirect_to encuesta_articulos_url, notice: 'Encuesta articulo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private


    def set_article
        @articulo=Articulo.find(params[:articulo_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_encuesta_articulo
      @encuesta_articulo = EncuestaArticulo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def encuesta_articulo_params
      puts params[:articulo_id]
      puts params[:valor]
      params.permit(:articulo_id, :valor)
    end
end
