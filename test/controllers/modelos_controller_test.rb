require "test_helper"

class ModelosControllerTest < ActionController::TestCase
  def modelo
    @modelo ||= modelos :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:modelos)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference("Modelo.count") do
      post :create, modelo: { nombre: modelo.nombre }
    end

    assert_redirected_to modelo_path(assigns(:modelo))
  end

  def test_show
    get :show, id: modelo
    assert_response :success
  end

  def test_edit
    get :edit, id: modelo
    assert_response :success
  end

  def test_update
    put :update, id: modelo, modelo: { nombre: modelo.nombre }
    assert_redirected_to modelo_path(assigns(:modelo))
  end

  def test_destroy
    assert_difference("Modelo.count", -1) do
      delete :destroy, id: modelo
    end

    assert_redirected_to modelos_path
  end
end
