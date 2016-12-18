require 'test_helper'

class RespuestaComentariosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @respuesta_comentario = respuesta_comentarios(:one)
  end

  test "should get index" do
    get respuesta_comentarios_url
    assert_response :success
  end

  test "should get new" do
    get new_respuesta_comentario_url
    assert_response :success
  end

  test "should create respuesta_comentario" do
    assert_difference('RespuestaComentario.count') do
      post respuesta_comentarios_url, params: { respuesta_comentario: { articulo_id: @respuesta_comentario.articulo_id, comentario_id: @respuesta_comentario.comentario_id, email: @respuesta_comentario.email, fecha_subida: @respuesta_comentario.fecha_subida, mensaje: @respuesta_comentario.mensaje, sitio: @respuesta_comentario.sitio } }
    end

    assert_redirected_to respuesta_comentario_url(RespuestaComentario.last)
  end

  test "should show respuesta_comentario" do
    get respuesta_comentario_url(@respuesta_comentario)
    assert_response :success
  end

  test "should get edit" do
    get edit_respuesta_comentario_url(@respuesta_comentario)
    assert_response :success
  end

  test "should update respuesta_comentario" do
    patch respuesta_comentario_url(@respuesta_comentario), params: { respuesta_comentario: { articulo_id: @respuesta_comentario.articulo_id, comentario_id: @respuesta_comentario.comentario_id, email: @respuesta_comentario.email, fecha_subida: @respuesta_comentario.fecha_subida, mensaje: @respuesta_comentario.mensaje, sitio: @respuesta_comentario.sitio } }
    assert_redirected_to respuesta_comentario_url(@respuesta_comentario)
  end

  test "should destroy respuesta_comentario" do
    assert_difference('RespuestaComentario.count', -1) do
      delete respuesta_comentario_url(@respuesta_comentario)
    end

    assert_redirected_to respuesta_comentarios_url
  end
end
