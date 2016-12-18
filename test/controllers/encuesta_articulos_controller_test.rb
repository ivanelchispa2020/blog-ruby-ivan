require 'test_helper'

class EncuestaArticulosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @encuesta_articulo = encuesta_articulos(:one)
  end

  test "should get index" do
    get encuesta_articulos_url
    assert_response :success
  end

  test "should get new" do
    get new_encuesta_articulo_url
    assert_response :success
  end

  test "should create encuesta_articulo" do
    assert_difference('EncuestaArticulo.count') do
      post encuesta_articulos_url, params: { encuesta_articulo: { articulo_id: @encuesta_articulo.articulo_id, bueno: @encuesta_articulo.bueno, excelente: @encuesta_articulo.excelente, interesante: @encuesta_articulo.interesante, poco_util: @encuesta_articulo.poco_util, regular: @encuesta_articulo.regular } }
    end

    assert_redirected_to encuesta_articulo_url(EncuestaArticulo.last)
  end

  test "should show encuesta_articulo" do
    get encuesta_articulo_url(@encuesta_articulo)
    assert_response :success
  end

  test "should get edit" do
    get edit_encuesta_articulo_url(@encuesta_articulo)
    assert_response :success
  end

  test "should update encuesta_articulo" do
    patch encuesta_articulo_url(@encuesta_articulo), params: { encuesta_articulo: { articulo_id: @encuesta_articulo.articulo_id, bueno: @encuesta_articulo.bueno, excelente: @encuesta_articulo.excelente, interesante: @encuesta_articulo.interesante, poco_util: @encuesta_articulo.poco_util, regular: @encuesta_articulo.regular } }
    assert_redirected_to encuesta_articulo_url(@encuesta_articulo)
  end

  test "should destroy encuesta_articulo" do
    assert_difference('EncuestaArticulo.count', -1) do
      delete encuesta_articulo_url(@encuesta_articulo)
    end

    assert_redirected_to encuesta_articulos_url
  end
end
