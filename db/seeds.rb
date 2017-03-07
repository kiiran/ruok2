# seed with first questions:
ConversationHistory.destroy_all
Answer.destroy_all
Question.destroy_all
TemplateQuestion.destroy_all
GroupMembership.destroy_all
Group.destroy_all
User.destroy_all

general_template_questions_hash = [
  TemplateQuestion.create(subject: "general", question_type: "opening_question", content: "How are you today?"),
  TemplateQuestion.create(subject: "general", question_type: "opening_question", content: "Tell me about your day"),
  TemplateQuestion.create(subject: "general", question_type: "opening_question", content: "How are you feeling?"),
  TemplateQuestion.create(subject: "general", question_type: "opening_question", content: "What's on your mind?"),

  TemplateQuestion.create(subject: "general", question_type: "neg", content: "Sounds like you're not having the best time. What could you do to make things better?"),
  TemplateQuestion.create(subject: "general", question_type: "neg", content: "Oh dear. How could you make things better?"),
  TemplateQuestion.create(subject: "general", question_type: "neg-solution", content: "Okey doke. Any more info you'd like to add?"),

  TemplateQuestion.create(subject: "general", question_type: "pos", content: "Sounds things are going well overall. Is there any way to make things go even better?"),
  TemplateQuestion.create(subject: "general", question_type: "pos-solution", content: "Okey doke. Any other info you'd like to give me?"),
]

family_template_questions_hash = [
  TemplateQuestion.create(subject: "family", question_type: "opening_question", content: "How's your family today?"),
  TemplateQuestion.create(subject: "family", question_type: "neg", content: "Tell me more about what's bothering you at home?"),
  TemplateQuestion.create(subject: "family", question_type: "pos", content: "Tell me more about what's great at home?"),
  TemplateQuestion.create(subject: "family", question_type: "pos-solution", content: "Ok, we I'm here to listen. Any other comments?"),
]

work_template_questions_hash = [
  TemplateQuestion.create(subject: "work", question_type: "opening_question", content: "How was work today?"),
  TemplateQuestion.create(subject: "work", question_type: "neg", content: "Tell me more about what's bothering you at work?"),
  TemplateQuestion.create(subject: "work", question_type: "pos", content: "Tell me more about what's great at work?"),
  TemplateQuestion.create(subject: "work", question_type: "pos-solution", content: "Ok, we I'm here to listen. Any other comments?"),
]

social_template_questions_hash = [
  TemplateQuestion.create(subject: "social", question_type: "opening_question", content: "How was the social life today?"),
  TemplateQuestion.create(subject: "social", question_type: "neg", content: "Tell me more about what's bothering you with your social life?"),
  TemplateQuestion.create(subject: "social", question_type: "pos", content: "Tell me more about what's great with your social life?"),
  TemplateQuestion.create(subject: "social", question_type: "pos-solution", content: "Ok, we I'm here to listen. Any other comments?"),
]


home_user = User.create(email: "home_user@dont-erase.com", password: "DO-NOT-ERASE-THIS-USER", first_name: "HOME", last_name: "USER")
home_group = Group.new
home_group_membership = GroupMembership.create(group: home_group, user: home_user)
home_group.save
home_conversations = ConversationHistory.create(user: home_user, group: home_group)

Group.create(name: "David the master")
Group.create(name: "Filipe the master")
Group.create(name: "Joao the master")

q1 = Question.create(conversation_history_id: home_conversations.id, subject: "work", content: "heloosjk1", template_question_id: 1)
q2 = Question.create(conversation_history_id: home_conversations.id, subject: "work", content: "hellos 2 this is hardcoded", template_question_id: 2)
q3 = Question.create(conversation_history_id: home_conversations.id, subject: "work", content: "Hardcode question 3", template_question_id: 3)

q4 = Question.create(conversation_history_id: home_conversations.id, subject: "family", content: "heloosjk1", template_question_id: 1)
q5 = Question.create(conversation_history_id: home_conversations.id, subject: "family", content: "hellos 2 this is hardcoded", template_question_id: 2)
q6 = Question.create(conversation_history_id: home_conversations.id, subject: "family", content: "Hardcode question 3", template_question_id: 3)

q7 = Question.create(conversation_history_id: home_conversations.id, subject: "social", content: "heloosjk1", template_question_id: 1)
q8 = Question.create(conversation_history_id: home_conversations.id, subject: "social", content: "hellos 2 this is hardcoded", template_question_id: 2)
q9 = Question.create(conversation_history_id: home_conversations.id, subject: "social", content: "Hardcode question 3", template_question_id: 3)

Answer.create(question_id: q1.id, pos: (rand(1..100).to_f / 100), neutral: rand(1..100).to_f / 100, neg: (rand(1..100).to_f / 100), content: "hello 1")
Answer.create(question_id: q2.id, pos: (rand(1..100).to_f / 100), neutral: (rand(1..100).to_f / 100), neg: (rand(1..100).to_f / 100), content: "hello 2")
Answer.create(question_id: q3.id, pos: (rand(1..100).to_f / 100), neutral: (rand(1..100).to_f / 100), neg: (rand(1..100).to_f / 100), content: "hello 3")

Answer.create(question_id: q4.id, pos: (rand(1..100).to_f / 100), neutral: rand(1..100).to_f / 100, neg: (rand(1..100).to_f / 100), content: "hello 1")
Answer.create(question_id: q5.id, pos: (rand(1..100).to_f / 100), neutral: (rand(1..100).to_f / 100), neg: (rand(1..100).to_f / 100), content: "hello 2")
Answer.create(question_id: q6.id, pos: (rand(1..100).to_f / 100), neutral: (rand(1..100).to_f / 100), neg: (rand(1..100).to_f / 100), content: "hello 3")

Answer.create(question_id: q7.id, pos: (rand(1..100).to_f / 100), neutral: rand(1..100).to_f / 100, neg: (rand(1..100).to_f / 100), content: "hello 1")
Answer.create(question_id: q8.id, pos: (rand(1..100).to_f / 100), neutral: (rand(1..100).to_f / 100), neg: (rand(1..100).to_f / 100), content: "hello 2")
Answer.create(question_id: q9.id, pos: (rand(1..100).to_f / 100), neutral: (rand(1..100).to_f / 100), neg: (rand(1..100).to_f / 100), content: "hello 3")
