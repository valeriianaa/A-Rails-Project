class Empleado < Persona
	belongs_to :ciudad
	belongs_to :pais
	belongs_to :provincia
	belongs_to :area
	belongs_to :departamento
	belongs_to :rol_de_empleado

	validates :departamento_id, :rol_de_empleado_id, presence: true

	def self.to_csv(options = {})
      CSV.generate(options) do |csv|
        csv << column_names
        all.each do |empleado|
          csv << empleado.attributes.values_at(*column_names)
        end
      end
    end

end
