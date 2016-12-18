class RespuestaComentariosController < ApplicationController
  before_action :set_respuesta_comentario, only: [:show, :edit, :update, :destroy]
  before_action :set_article

  # GET /respuesta_comentarios
  # GET /respuesta_comentarios.json
  def index
    @respuesta_comentarios = RespuestaComentario.all
  end

  # GET /respuesta_comentarios/1
  # GET /respuesta_comentarios/1.json
  def show
  end

  # GET /respuesta_comentarios/new
  def new
    @respuesta_comentario = RespuestaComentario.new
  end

  # GET /respuesta_comentarios/1/edit
  def edit
  end

  # POST /respuesta_comentarios
  # POST /respuesta_comentarios.json
  def create
    @respuesta_comentario = RespuestaComentario.new(respuesta_comentario_params)
    @respuesta_comentario.articulo=@articulo
    @respuesta_comentario.comentario=@comentario

    respond_to do |format|
      if @respuesta_comentario.save
        format.html { redirect_to @respuesta_comentario.articulo, notice: 'Respuesta comentario was successfully created.' }
        format.json { render :show, status: :created, location: @respuesta_comentario }
      else
        format.html { render :new }
        format.json { render json: @respuesta_comentario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /respuesta_comentarios/1
  # PATCH/PUT /respuesta_comentarios/1.json
  def update
    respond_to do |format|
      if @respuesta_comentario.update(respuesta_comentario_params)
        format.html { redirect_to @respuesta_comentario, notice: 'Respuesta comentario was successfully updated.' }
        format.json { render :show, status: :ok, location: @respuesta_comentario }
      else
        format.html { render :edit }
        format.json { render json: @respuesta_comentario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /respuesta_comentarios/1
  # DELETE /respuesta_comentarios/1.json
  def destroy
    @respuesta_comentario.destroy
    respond_to do |format|
      format.html { redirect_to respuesta_comentarios_url, notice: 'Respuesta comentario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
    def set_article
       puts params[:articulo_id]
       puts params[:comentario_id]
          @articulo=Articulo.find(params[:articulo_id])
          @comentario=Comentario.find(params[:comentario_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_respuesta_comentario
      @respuesta_comentario = RespuestaComentario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def respuesta_comentario_params
      params.require(:respuesta_comentario).permit(:articulo_id, :comentario_id, :email, :sitio, :mensaje, :fecha_subida,:avatar)
    end
end
