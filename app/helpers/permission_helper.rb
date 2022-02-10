module  PermissionHelper
    def is_current_user_or_admin?(obj)
        logged_in? && ( (obj.user == current_user) || (current_role == 'admin')) 
    end
end