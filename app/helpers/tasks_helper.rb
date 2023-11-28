module TasksHelper
  def status_color(status)
    case status
    when 'NOT STARTED'
      'red'
    when 'IN PROGRESS'
      'orange'
    when 'COMPLETED'
      'green'
    else
      'black'
    end
  end
end
