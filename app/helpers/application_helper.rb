module ApplicationHelper
  def markdown(text)
    options = {
      hard_wrap: true,
      space_after_headers: true,
      fenced_code_blocks: true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer)

    markdown.render(text).html_safe
  end

  def get_link_to_object_by_user(user)
    if user.contestant?
      contestant_path Contestant.joins(:user).where(users: { id: user.id }).last
    elsif user.recruiter?
      recruiter_path Recruiter.joins(:user).where(users: { id: user.id }).last
    elsif user.school?
      school_path School.joins(:user).where(users: { id: user.id }).last
    end
  end

  def all_unread_messages_count
    user_conversations = Conversation.where('sender_id = ? OR receiver_id = ?', current_user.id, current_user.id)
    user_conversations.inject(0) { |sum, e| sum + e.unread_message_count(current_user) }.to_s
  end
end
