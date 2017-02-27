require "test_helper"

class AreaTestTest < ActionDispatch::IntegrationTest

  def test_area_prueba
  	visit('/user/sign_in')
  	fill_in('user_email', :with => 'valeriianaa@gmail.com')
  	fill_in('user_password', :with => '12345678')
  	click_button('Iniciar Sesión')
    visit areas_url
    click_link('Nuevo')
    assert_equal('/areas/new', current_path)
    puts current_path
    fill_in('area_nombre', :with => 'John')
    click_button('Guardar')
    within('h3') do 
    	assert has_content?('Datos del área')
    end
    Capybara.add_selector(:td_nombre) do
	  xpath { "/html/body/div/div/section[2]/div[1]/div/div/div[2]/table/tbody/tr/td[1]/strong" }
	end
    within(:td_nombre) do 
    	assert has_content?('Nombre')
    end
    Capybara.add_selector(:td_value) do 
    	xpath {"/html/body/div/div/section[2]/div[1]/div/div/div[2]/table/tbody/tr/td[2]"}
    end
    within(:td_value) do 
    	assert has_content?('John')
    end
    puts current_path
  end
end
