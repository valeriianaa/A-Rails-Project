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
