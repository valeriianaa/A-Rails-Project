require "test_helper"

class VencimientosControllerTest < ActionController::TestCase
  def vencimiento
    @vencimiento ||= vencimientos :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:vencimientos)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference("Vencimiento.count") do
      post :create, vencimiento: { fecha: vencimiento.fecha }
    end

    assert_redirected_to vencimiento_path(assigns(:vencimiento))
  end

  def test_show
    get :show, id: vencimiento
    assert_response :success
  end

  def test_edit
    get :edit, id: vencimiento
    assert_response :success
  end

  def test_update
    put :update, id: vencimiento, vencimiento: { fecha: vencimiento.fecha }
    assert_redirected_to vencimiento_path(assigns(:vencimiento))
  end

  def test_destroy
    assert_difference("Vencimiento.count", -1) do
      delete :destroy, id: vencimiento
    end

    assert_redirected_to vencimientos_path
  end
end
