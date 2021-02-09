module ApplicationHelper

  def year
    Time.now.year
  end

  def github_author(author, repo)
    link_to 'TestGuru', "https://github.com/#{author}/#{repo}"
  end

  def flash_class(level)
    case level
      when 'notice' then "info"
      when 'success' then "success"
      when 'error' then "danger"
      when 'alert' then "warning"
    end
  end
end
