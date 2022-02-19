#delete all data in wings
# Wing.delete_all
# User.delete_all
# Role.delete_all
# Note.delete_all
# NoteWing.delete_all

#reset primary key to start from 1
ActiveRecord::Base.connection.reset_pk_sequence!('wings')
ActiveRecord::Base.connection.reset_pk_sequence!('users')
ActiveRecord::Base.connection.reset_pk_sequence!('roles')
ActiveRecord::Base.connection.reset_pk_sequence!('notes')
ActiveRecord::Base.connection.reset_pk_sequence!('note_wings')
ActiveRecord::Base.connection.reset_pk_sequence!('comments')
wings = ['Main / ALL', 'Willows', 'Oaks', 'Juniper', 'Acacia', 'Myrtle']
wings.each_with_index do |wing, index|
    Wing.create(name: wing, display_order: index+1)
end

tags = ['Important', 'New resident', 'Stock need', 'Special request', 'Announcement']
tags.each do |tag| 
    Tag.create(name: tag)
end

roles = ['admin', 'manager', 'staff']
roles.each { |role| Role.create(name: role)}
admin = User.create(username: 'admin', password: '1111', role_id: 1)

9.times do 
    User.create(
        username: Faker::Name.first_name.downcase,
        password: '1111',
        role_id: rand(2..3)
    )
end

100.times do
    Note.create(
        title: Faker::Lorem.sentence(word_count: rand(3..10)),
        require_ack: false,
        bump: 0,
        content: Faker::Lorem.paragraph(sentence_count: rand(5..30)),
        user_id: rand(1..10),
        published: true
    )
end

100.times do |index|
    NoteWing.create(
        note_id: index+1,
        wing_id: rand(1..6)
    )
end

1000.times do
    Comment.create(
        content: Faker::Lorem.sentence(word_count: rand(3..10)),
        user_id: rand(1..10),
        note_id: rand(1..100)
    )
end


