class ArticulosController < ApplicationController
  before_action :set_articulo, only: [:show, :edit, :update, :destroy]

  # GET /articulos
  # GET /articulos.json
  def index
    @categorias=Categoria.all
    @ultimos_articulos=Articulo.all.order('id ASC').reverse_order.limit(5)
    @total_comentarios=Articulo.joins(:comentarios)

    if !request.params[:q].nil?
        @parametro=params[:q]
        @articulos = Articulo.where("titulo LIKE ? or parrafo LIKE ? or parrafo_principal LIKE ?","%#{params[:q]}%","%#{params[:q]}%","%#{params[:q]}%").paginate(:page => params[:page], :per_page => 5)
        @articulos_encontrados=Articulo.where("titulo LIKE ? or parrafo LIKE ? or parrafo_principal LIKE ?","%#{params[:q]}%","%#{params[:q]}%","%#{params[:q]}%").count
   end 

   if !request.params[:cat].nil?
        @parametro_cat=params[:cat]
        @articulos = Articulo.where("categoria =?",params[:cat]).paginate(:page => params[:page], :per_page => 5)
        @nombre_categoria=Categoria.where("id_categoria =?",params[:cat])
    end

     if   request.params[:q].nil? and request.params[:cat].nil? 
       @articulos = Articulo.all.paginate(:page => params[:page], :per_page => 5)
    end


  end

  # GET /articulos/1
  # GET /articulos/1.json
  def show
      @articulo= Articulo.find(params[:id])
      @categorias=Categoria.all
      @ultimos_articulos=Articulo.all.order('id ASC').reverse_order.limit(5)
      @comentario=Comentario.new
      @total_comentarios=Comentario.where(articulo_id: params[:id]).count()
      @respuesta_comentario = RespuestaComentario.new
      @respuestas_de_comentarios=RespuestaComentario.where(articulo_id: params[:id])
      @encuesta_articulo=EncuestaArticulo.new
      @encuesta_articulos=EncuestaArticulo.where(articulo_id: params[:id])
      @categoria_nombre=Categoria.where("id_categoria=?",@articulo.categoria)
  
    if !request.params[:q].nil?
           redirect_to  articulos_path + "?q=#{params[:q]}"     
    end



  end


  # GET /articulos/new
  def new
    @articulo = Articulo.new
  end

  # GET /articulos/1/edit
  def edit
  end

  # POST /articulos
  # POST /articulos.json
  def create
    @articulo = Articulo.new(articulo_params)

    respond_to do |format|
      if @articulo.save
        format.html { redirect_to @articulo, notice: 'Articulo was successfully created.' }
        format.json { render :show, status: :created, location: @articulo }
      else
        format.html { render :new }
        format.json { render json: @articulo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articulos/1
  # PATCH/PUT /articulos/1.json
  def update
    respond_to do |format|
      if @articulo.update(articulo_params)
        format.html { redirect_to @articulo, notice: 'Articulo was successfully updated.' }
        format.json { render :show, status: :ok, location: @articulo }
      else
        format.html { render :edit }
        format.json { render json: @articulo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articulos/1
  # DELETE /articulos/1.json
  def destroy
    @articulo.destroy
    respond_to do |format|
      format.html { redirect_to articulos_url, notice: 'Articulo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_articulo
      @articulo = Articulo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def articulo_params
      params.require(:articulo).permit(:titulo, :parrafo, :parrafo_principal, :autor, :fecha_subida)
    end
end
