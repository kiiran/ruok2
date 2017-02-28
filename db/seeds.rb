# seed with first questions:
Question.destroy_all
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

home_user = User.create(email: "cant_be_blank@blank.com", password: "can't be blank", first_name: "can't be blank", last_name: "can't be blank")
home_group = Group.new
home_group_membership = GroupMembership.create(group: home_group, user: home_user)
home_group.save
home_conversations = ConversationHistory.create(user: home_user, group: home_group)

questions_by_subject.each do |subject, questions|
  questions.each do |question|
      q01 = Question.new(content: question, subject: subject )
      q01.conversation_history = home_conversations
      q01.save
  end
end

