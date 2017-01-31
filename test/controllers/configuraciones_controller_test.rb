require "test_helper"

class ConfiguracionesControllerTest < ActionController::TestCase
  def configuracion
    @configuracion ||= configuraciones :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:configuraciones)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference("Configuracion.count") do
      post :create, configuracion: {  }
    end

    assert_redirected_to configuracion_path(assigns(:configuracion))
  end

  def test_show
    get :show, id: configuracion
    assert_response :success
  end

  def test_edit
    get :edit, id: configuracion
    assert_response :success
  end

  def test_update
    put :update, id: configuracion, configuracion: {  }
    assert_redirected_to configuracion_path(assigns(:configuracion))
  end

  def test_destroy
    assert_difference("Configuracion.count", -1) do
      delete :destroy, id: configuracion
    end

    assert_redirected_to configuraciones_path
  end
end
