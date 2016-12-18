require 'test_helper'

class RespuestaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @respuestum = respuesta(:one)
  end

  test "should get index" do
    get respuesta_url
    assert_response :success
  end

  test "should get new" do
    get new_respuestum_url
    assert_response :success
  end

  test "should create respuestum" do
    assert_difference('Respuestum.count') do
      post respuesta_url, params: { respuestum: { articulo_id: @respuestum.articulo_id, comentario_id: @respuestum.comentario_id, email: @respuestum.email, fecha_subida: @respuestum.fecha_subida, mensaje: @respuestum.mensaje, sitio: @respuestum.sitio } }
    end

    assert_redirected_to respuestum_url(Respuestum.last)
  end

  test "should show respuestum" do
    get respuestum_url(@respuestum)
    assert_response :success
  end

  test "should get edit" do
    get edit_respuestum_url(@respuestum)
    assert_response :success
  end

  test "should update respuestum" do
    patch respuestum_url(@respuestum), params: { respuestum: { articulo_id: @respuestum.articulo_id, comentario_id: @respuestum.comentario_id, email: @respuestum.email, fecha_subida: @respuestum.fecha_subida, mensaje: @respuestum.mensaje, sitio: @respuestum.sitio } }
    assert_redirected_to respuestum_url(@respuestum)
  end

  test "should destroy respuestum" do
    assert_difference('Respuestum.count', -1) do
      delete respuestum_url(@respuestum)
    end

    assert_redirected_to respuesta_url
  end
end
