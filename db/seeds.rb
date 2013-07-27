# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Messages.create content: '如果你的代码易于阅读，那么代码中bug也将会很', to_user: 'gh_418963502e3c',
               from_user:'oGHz6jqRjNHwBo_a_s', message_type: 'text',
               create_time: DateTime.now, message_id: 5893056478695514624

Messages.create content: '因此，如果项目中有多人参与，采取一个有共识的编码风格约定非常有必要。', to_user: 'gh_418963502e3c',
               from_user:'oGHz6jqRjNHwBo_a_s', message_type: 'text',
               create_time: DateTime.now, message_id: 5893056478695514624
