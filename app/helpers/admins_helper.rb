module AdminsHelper

  def year_ago(y)
    Time.now.years_ago(y).year
  end
  def year_coming(y)
    Time.now.years_ago(-y).year
  end

end
