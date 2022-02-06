#delete all data in wings
Wing.delete_all
#reset primary key to start from 1
ActiveRecord::Base.connection.reset_pk_sequence!('wings')
ActiveRecord::Base.connection.reset_pk_sequence!('users')
wings = ['Main', 'Willows', 'Oaks', 'Juniper', 'Acacia', 'Myrtle']
wings.each_with_index do |wing, index|
    Wing.create(name: wing, display_order: index+1)
end

User.create(username: 'admin')
