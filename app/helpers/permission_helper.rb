module  PermissionHelper
    def is_current_user_or_admin?(obj)
        logged_in? && ((obj.user == current_user) || (current_role == 'admin')) 
    end

    def is_manager_or_admin?
        logged_in? && ((current_role == 'admin') || (current_role == 'manager'))
    end
end