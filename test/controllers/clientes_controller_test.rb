require "test_helper"

class ClientesControllerTest < ActionController::TestCase
  def cliente
    @cliente ||= clientes :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:clientes)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference("Cliente.count") do
      post :create, cliente: {  }
    end

    assert_redirected_to cliente_path(assigns(:cliente))
  end

  def test_show
    get :show, id: cliente
    assert_response :success
  end

  def test_edit
    get :edit, id: cliente
    assert_response :success
  end

  def test_update
    put :update, id: cliente, cliente: {  }
    assert_redirected_to cliente_path(assigns(:cliente))
  end

  def test_destroy
    assert_difference("Cliente.count", -1) do
      delete :destroy, id: cliente
    end

    assert_redirected_to clientes_path
  end
end
