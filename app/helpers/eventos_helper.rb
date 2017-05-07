module EventosHelper

def getEspecialidadesByContactos
    @contactos = Contacto.all

    unHash = Hash.new 

    @contactos.each do |c|
        especialidadesArray = []
        c.especialidades_de_contacto.each do |e|
            especialidadesArray.push [e.id, e.nombre]
        end
        unHash[c.id.to_s.to_sym] = especialidadesArray
    end
    
    return unHash
end

end
