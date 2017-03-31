require "test_helper"

class PagosTest < ActionDispatch::IntegrationTest
  def wait_for_ajax
    Timeout.timeout(Capybara.default_wait_time) do
      active = page.evaluate_script('jQuery.active')
      until active == 0
        active = page.evaluate_script('jQuery.active')
      end
    end
  end

  def test_pagos_prueba
    visit('/user/sign_in')
    fill_in('user_email', :with => 'valeriianaa@gmail.com')
    fill_in('user_password', :with => '12345678')
    click_button('Iniciar Sesión')
    visit pagos_url
    click_link('Nuevo')
    select('PR-001', :from=>'pago_proyecto_id')
    find('#bt-filtrar').click 
    expect(page).to have_content("Proyecto: Pro Care, Jardines")
    assert_equal('Proyecto: Pro Care, Jardines', find('#proyecto-titulo').text)
  end
end
