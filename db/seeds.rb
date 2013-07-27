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

Messages.create picture_url: 'http://localhost:3000/assets/elephant.jpg', to_user: 'gh_418963502e3c',
                from_user:'oGHz6jqRjNHwBo_a_s', message_type: 'image',
                create_time: DateTime.now, message_id: 5893056478695514624


Messages.create picture_url: 'http://localhost:3000/assets/qrcode.jpg', to_user: 'gh_418963502e3c',
                from_user:'oGHz6jqRjNHwBo_a_s', message_type: 'image',
                create_time: DateTime.now, message_id: 5893056478695514624


Messages.create content: "周教授的微博掀起了两派争论。一派以“守寂沉空”为代表，发帖称：这个论文显然是不能通过的。秀文艺用错了地方会让人觉得油腻。诗讲究情感，学术研究是理性的，遵守的不是艺术的逻辑。另一派则以“胡野秋”为代表，发帖称：关键看内容，陈寅恪的《柳如是別传》也是用小说写唐史。如今的所谓论文格式化要求已毁了论文。",
                to_user: 'gh_418963502e3c',
                from_user:'oGHz6jqRjNHwBo_a_s', message_type: 'notice',
                create_time: DateTime.now, message_id: 5893056478695514624
