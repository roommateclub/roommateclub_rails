module GroupsHelper
  def user_group_ship_state(group, user_group_ship)
    case user_group_ship.state
    when "pending"
      "已經發出邀請，正在等待發起人同意"
    when "approved"
      "已加入" unless group.organizer == current_user
    when "rejected"
      "發起人拒絕您的加入"
    end
  end
end
