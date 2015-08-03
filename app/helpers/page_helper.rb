module PageHelper

  def calendar( month, year )
    current_date = Date.new(year, month, 1)

    prev_month = month - 1
    prev_year = year
    if (prev_month <= 0)
      prev_month = 12
      prev_year = year - 1
    end

    next_month = month + 1
    next_year = year
    if (next_month > 12)
      next_month = 1
      next_year = year + 1
    end

    cal = current_date.strftime("%B")
    cal += "<br/>"
    cal += link_to "Prev", calendar_path(:month=> prev_month, :year => prev_year).to_s
    cal += link_to "   Next", calendar_path(:month=> next_month, :year => next_year).to_s
    day_of_week = current_date.strftime('%w').to_i
    cal += "<table border='1'>\n\t<tr>\n"
    days = %w(Sun Mon Tue Wed Thu Fri Sat)
    days.each do | day |
      cal += "\t\t<td>#{day}</td>\n"
    end

    # Second Row = first week of the month
    cal += "\t\t<tr>\n"
    day_of_week.times do
      cal += "\t\t\t<td>&nbsp;</td>\n"
    end

    # Print the days of week starting with 1

    (7 - day_of_week).times do | day|
      cal += "\t\t\t<td>#{day+1}</td>\n"
    end

    # Loop to do the in between rows


    # Final loop to do the last row
    # numbered till end of days, then blank days till end of month


    cal += "\t\t</tr>\n"
    cal += "\t</tr>\n</table>\n"
    cal += "Month: #{month}<br/>Year: #{year}<br/>"
    cal += "Date: #{current_date}<br/>"
    cal += day_of_week.to_s
    return cal
  end
end
