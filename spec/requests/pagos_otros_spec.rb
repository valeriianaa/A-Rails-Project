require 'rails_helper'

RSpec.feature "PagosOtros", type: :feature do
  feature 'User creates a foobar' do
    it "works! (now write some real specs)", :js => true do
      puts 'hola'
      visit('/user/sign_in')
      puts current_path
      fill_in('user_email', :with => 'valeriianaa@gmail.com')
      fill_in('user_password', :with => '12345678')
      click_button('Iniciar Sesión')
      puts current_path
      visit('/pagos')
      click_link('Nuevo')
      select('PR-001', :from=>'pago_proyecto_id')
      page.execute_script("$('#bt-filtrar').click()")
      puts 'hasta aca todo bien'
      puts current_path
      wait_for_ajax
      assert_equal('Proyecto: Pro Care, Jardines', find('#proyecto-titulo').text)
      Capybara.add_selector(:check_pago) do
        xpath { "//*[@id="tabla_cuotas"]/tbody/tr[1]/td[7]/input[2]" }
      end
      check(:check_pago)
      click_button('[+] Añadir forma de pago')
      Capybara.add_selector(:select_metodo_pago) do
        xpath {"//*[@id="pago_pagos_metodos_attributes_1490289565958_tipo_de_pago_id"]"}
      end
      puts 'chau'
    end
  end

  def wait_for_ajax
    Timeout.timeout(Capybara.default_max_wait_time) do
      loop until finished_all_ajax_requests?
    end
  end

  def finished_all_ajax_requests?
    page.evaluate_script('jQuery.active').zero?
  end
end
