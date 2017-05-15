class Empleado < Persona
    belongs_to :ciudad
    belongs_to :pais
    belongs_to :provincia
    belongs_to :area
    belongs_to :departamento
    belongs_to :rol_de_empleado

    validates :departamento_id, :rol_de_empleado_id, presence: true
    #after_create :cambiar_auditorias_a_empleado
    #after_update :cambiar_auditorias_a_empleado

    # def cambiar_auditorias_a_empleado
    #     self.audits.each do |a|
    #         if a.audit_type == "Persona"
    #             a.update(audit_type: "Empleado")
    #         end
    #     end
    # end
end
