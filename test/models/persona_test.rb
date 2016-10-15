require "test_helper"

class PersonaTest < ActiveSupport::TestCase
  # def persona
  #   @persona ||= Persona.new
  # end

  # def test_valid
  #   assert persona.valid?
  # end
  def test_ejemplos_personas
   per1 = Persona.new(:nombre => 'Ana', :apellido => 'Canteros', :nroIdentificacion => '36063076', :fechaNacimiento => '1991-11-05', :direccion => 'colon 123', :telefono => '4401604', :email => 'canterosanav@gmail.com')
   per2 = Persona.new(:nombre => nil, :apellido => 'Ramirez', :nroIdentificacion => '36063076', :fechaNacimiento => '1991-11-05', :direccion => 'colon 123', :telefono => '4401604', :email => 'canterosanav@gmail.com')
   per3 = Persona.new(:nombre => 'Pedro', :apellido => nil, :nroIdentificacion => '36063076', :fechaNacimiento => '1991-11-05', :direccion => 'colon 123', :telefono => '4401604', :email => 'canterosanav@gmail.com')
  end
  
  def test_es_valido
    assert(per1.valid?, per1.errors.messages)
    #assert(per2.valid?, per2.errors.messages)
    assert(per3.valid?, per3.errors.messages)
  end
  #assert_equal ["is not a number"], per1.errors.messages[:nombre]
  #test "per1_valid" do
	# assert(per1.valid?, per1.errors.messages)
  #end

  #test "is_documento_unico" do
	#  assert(per2.valid?, per2.errors.messages[:nroIdentificacion])
  #end

  #test "is_direccion_unica" do
	#  assert(per3.valid?, per3.errors.messages[:direccion])
  #end
end
