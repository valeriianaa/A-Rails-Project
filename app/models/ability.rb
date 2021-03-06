class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #user ||= User.new # guest user (not logged in)
    user ||= User.new
    if user.rol? :super_admin
      can :read, :all
      can :manage, :all
      # cannot :destroy, User do |usuario|
      #   usuario.persona.nombre == "Martina"
      # end
    else
      user.rol.permisos.each do |permiso|
        # if permission.subject_class == "all"
          # can permission.action.to_sym, permission.subject_class.to_sym
        # else
        # Esto permite navegar en el Menu Principal
        if ["index"].include? permiso.accion.key_name
          can :read, permiso.modelo.nombre.constantize  
        end
        can permiso.accion.key_name.to_sym, permiso.modelo.nombre.constantize
      end
    end
    
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
