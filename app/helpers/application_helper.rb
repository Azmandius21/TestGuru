# frozen_string_literal: true

module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to author.to_s, repo.to_s, target: '_blank'
  end

  def flash_message(key)
    if flash[key]
      content_tag :p, flash[key], class: 'flash alert'
    end
  end
end
