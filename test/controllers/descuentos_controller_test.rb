require "test_helper"

class DescuentosControllerTest < ActionController::TestCase
  def descuento
    @descuento ||= descuentos :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:descuentos)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference("Descuento.count") do
      post :create, descuento: { descripcion: descuento.descripcion, nombre: descuento.nombre, porcentaje: descuento.porcentaje }
    end

    assert_redirected_to descuento_path(assigns(:descuento))
  end

  def test_show
    get :show, id: descuento
    assert_response :success
  end

  def test_edit
    get :edit, id: descuento
    assert_response :success
  end

  def test_update
    put :update, id: descuento, descuento: { descripcion: descuento.descripcion, nombre: descuento.nombre, porcentaje: descuento.porcentaje }
    assert_redirected_to descuento_path(assigns(:descuento))
  end

  def test_destroy
    assert_difference("Descuento.count", -1) do
      delete :destroy, id: descuento
    end

    assert_redirected_to descuentos_path
  end
end
