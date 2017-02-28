# seed with first questions:
ConversationHistory.destroy_all
GroupMembership.destroy_all
Group.destroy_all
User.destroy_all
Question.destroy_all


generic_first_questions = [
  "How are you today?",
  "What are you up to?",
  "How are you feeling?",
  "What's on your mind?"
]
subjects = [
  "generic first question",
  "generic second question",
  "generic third question"
]

home_user = User.create(email: "cant_be_blank@blank.com", password: "can't be blank", first_name: "can't be blank", last_name: "can't be blank")
home_group = Group.new
home_group_membership = GroupMembership.create(group: home_group, user: home_user)
home_group.save
home_conversations = ConversationHistory.create(user: home_user, group: home_group)

generic_first_questions.each do |question|
    q01 = Question.new(content: question, subject: "generic first question" )
    q01.conversation_history = home_conversations
    q01.save
end
