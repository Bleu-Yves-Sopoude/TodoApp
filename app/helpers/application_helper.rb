module ApplicationHelper
    def icon_for_status(status)
        case status
        when 'pending'     then "🕒"
        when 'in_progress' then "🚧"
        when 'completed'   then "✅"
        else "❓"
        end
      end
end
