module ApplicationHelper
	def pluralize_without_count count, singular, plural=nil
	  ((count == 1 || count =~ /^1(\.0+)?$/) ? singular : (plural || singular.pluralize))
	end

	# def link_to_remove_fields(name, f)
 #    f.hidden_field(:_destroy) + link_to(name, "#", onclick: "remove_fields(this)")
 #  end
  
  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, :child_index => id) do |builder|
      render(association.to_s, :f => builder)
    end
    link_to(name, "#", class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end

end
