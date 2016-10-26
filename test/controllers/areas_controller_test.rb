require "test_helper"

class AreasControllerTest < ActionController::TestCase
  def area
    @area ||= areas :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:areas)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference("Area.count") do
      post :create, area: { nombre: area.nombre }
    end

    assert_redirected_to area_path(assigns(:area))
  end

  def test_show
    get :show, id: area
    assert_response :success
  end

  def test_edit
    get :edit, id: area
    assert_response :success
  end

  def test_update
    put :update, id: area, area: { nombre: area.nombre }
    assert_redirected_to area_path(assigns(:area))
  end

  def test_destroy
    assert_difference("Area.count", -1) do
      delete :destroy, id: area
    end

    assert_redirected_to areas_path
  end
end
