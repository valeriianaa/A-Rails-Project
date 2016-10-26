require "test_helper"

class EventosControllerTest < ActionController::TestCase
  def evento
    @evento ||= eventos :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:eventos)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference("Evento.count") do
      post :create, evento: { descripcion: evento.descripcion, dia: evento.dia, hora: evento.hora, nombre: evento.nombre }
    end

    assert_redirected_to evento_path(assigns(:evento))
  end

  def test_show
    get :show, id: evento
    assert_response :success
  end

  def test_edit
    get :edit, id: evento
    assert_response :success
  end

  def test_update
    put :update, id: evento, evento: { descripcion: evento.descripcion, dia: evento.dia, hora: evento.hora, nombre: evento.nombre }
    assert_redirected_to evento_path(assigns(:evento))
  end

  def test_destroy
    assert_difference("Evento.count", -1) do
      delete :destroy, id: evento
    end

    assert_redirected_to eventos_path
  end
end
