# frozen_string_literal: true

module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to author.to_s, repo.to_s, target: '_blank'
  end

  def is_user_admin?(user)
    user.is_a?(Admin)
  end
end
