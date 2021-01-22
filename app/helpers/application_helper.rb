module ApplicationHelper
  
  def year
    Time.now.year
  end

  def github_author(author, repo)
    link_to 'TestGuru', "https://github.com/#{author}/#{repo}"
  end
end
