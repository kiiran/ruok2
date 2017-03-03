# seed with first questions:
Answer.destroy_all
Question.destroy_all
TemplateQuestion.destroy_all
ConversationHistory.destroy_all
GroupMembership.destroy_all
Group.destroy_all
User.destroy_all

questions_by_subject = {
  "generic_first_questions" => [
    "How are you today?",
    "What are you up to?",
    "How are you feeling?",
    "What's on your mind?"
  ],
  "generic_second_questions" => [
    "How does that make you feel?",
    "Why do you feel that way?",
    "Does it happen often?",
    "How did it go?"
  ],
  "generic_third_questions" => [
    "What will you do to improve on that?",
    "anything else you'd like to tell me?",
    "Do you have children?",
    "What are your online banking login details?"
  ]
}

# subjects = [
#   generic_first_questions,
#   generic_second_questions,
#   generic_third_questions
# ]

home_user = User.create(email: "home_user@dont-erase.com", password: "DO-NOT-ERASE-THIS-USER", first_name: "HOME", last_name: "USER")
home_group = Group.new
home_group_membership = GroupMembership.create(group: home_group, user: home_user)
home_group.save
home_conversations = ConversationHistory.create(user: home_user, group: home_group)

questions_by_subject.each do |subject, questions|
  questions.each do |question|
      q01 = TemplateQuestion.create(content: question, subject: subject )
  end
end

Group.create(name: "David the master")
Group.create(name: "Filipe the master")
Group.create(name: "Joao the master")

Question.create(conversation_history_id: home_conversations.id, subject: "home", content: "hello?1", template_question_id: 1)
Question.create(conversation_history_id: home_conversations.id, subject: "home", content: "hello?2", template_question_id: 2)
Question.create(conversation_history_id: home_conversations.id, subject: "home", content: "hello?3", template_question_id: 3)


Answer.create(question_id: 1, pos: rand(1..100).to_f, neutral: rand(1..100).to_f, neg: rand(1..100).to_f, content: "hello 1")
Answer.create(question_id: 2, pos: rand(1..100).to_f, neutral: rand(1..100).to_f, neg: rand(1..100).to_f, content: "hello 2")
Answer.create(question_id: 3, pos: rand(1..100).to_f, neutral: rand(1..100).to_f, neg: rand(1..100).to_f, content: "hello 3")

