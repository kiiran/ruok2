# seed with first questions:
Answer.destroy_all
Question.destroy_all
TemplateQuestion.destroy_all
ConversationHistory.destroy_all
GroupMembership.destroy_all
Group.destroy_all
User.destroy_all

TemplateQuestion.create(subject: "opening_question", content: "How are you today?")
TemplateQuestion.create(subject: "opening_question", content: "Tell me about your day")
TemplateQuestion.create(subject: "opening_question", content: "How are you feeling?")
TemplateQuestion.create(subject: "opening_question", content: "What's on your mind?")

TemplateQuestion.create(subject: "neg", content: "Sounds like you're not having the best time. What could you do to make things better?")
TemplateQuestion.create(subject: "neg", content: "Oh dear. How could you make things better?")
TemplateQuestion.create(subject: "neg-solution", content: "Okey doke. Any more info you'd like to add?")

TemplateQuestion.create(subject: "pos", content: "Sounds things are going well overall. Is there any way to make things go even better?")
TemplateQuestion.create(subject: "pos-solution", content: "Okey doke. Any other info you'd like to give me?")



home_user = User.create(email: "home_user@dont-erase.com", password: "DO-NOT-ERASE-THIS-USER", first_name: "HOME", last_name: "USER")
home_group = Group.new
home_group_membership = GroupMembership.create(group: home_group, user: home_user)
home_group.save
home_conversations = ConversationHistory.create(user: home_user, group: home_group)

Group.create(name: "David the master")
Group.create(name: "Filipe the master")
Group.create(name: "Joao the master")

