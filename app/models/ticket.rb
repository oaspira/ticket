class Ticket < ApplicationRecord
  scope :for_period, ->(start_date, end_date) { where(created_at: start_date..end_date) }

  def self.diff_from_previous_day
    last_day = Ticket.where(created_at: 1.day.ago.all_day).count
    today_count = Ticket.where(created_at: Time.zone.now.all_day).count

    if last_day.zero?
      percent_change = today_count * 100.0
    else
      percent_change = ((today_count - last_day).to_f / last_day) * 100
    end

    percent_change
  end
end
