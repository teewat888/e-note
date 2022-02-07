#delete all data in wings
Wing.delete_all
User.delete_all
Role.delete_all
#reset primary key to start from 1
ActiveRecord::Base.connection.reset_pk_sequence!('wings')
ActiveRecord::Base.connection.reset_pk_sequence!('users')
ActiveRecord::Base.connection.reset_pk_sequence!('roles')
wings = ['Main', 'Willows', 'Oaks', 'Juniper', 'Acacia', 'Myrtle']
wings.each_with_index do |wing, index|
    Wing.create(name: wing, display_order: index+1)
end

roles = ['admin', 'manager', 'staff']
roles.each { |role| Role.create(name: role)}
admin = User.create(username: 'admin', password: '1111', role_id: 1)