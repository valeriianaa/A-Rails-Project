require 'rails_helper'

RSpec.feature "PagosOtros", type: :feature do
  feature 'User creates a foobar' do
    it "works! (now write some real specs)" do
      puts 'hola'
      visit('/user/sign_in')
      fill_in('user_email', :with => 'valeriianaa@gmail.com')
      fill_in('user_password', :with => '12345678')
      click_button('Iniciar Sesión')
      visit pagos_url
      click_link('Nuevo')
      select('PR-001', :from=>'pago_proyecto_id')
      find('#bt-filtrar').click 
      wait_for_ajax
      assert_equal('Proyecto: Pro Care, Jardines', find('#proyecto-titulo').text)
      puts 'chau'
    end
  end
end
