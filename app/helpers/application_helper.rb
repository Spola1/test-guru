module ApplicationHelper
  def year
    "#{Time.now.year.to_i}"
  end

  def github_author(author, repo)
    "https://github.com/#{author}/#{repo}"
  end
end
