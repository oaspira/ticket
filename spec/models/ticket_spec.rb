require 'rails_helper'

RSpec.describe Ticket, type: :model do
  it "is valid with a title" do
    ticket = Ticket.new(title: "Test Ticket")
    expect(ticket).to be_valid
  end

  describe ".for_period" do
    it "returns tickets within the given period" do
      start_date = Time.zone.now.beginning_of_day
      end_date = Time.zone.now.end_of_day
      ticket1 = Ticket.create!(title: "Ticket 1", created_at: 1.hour.ago)
      ticket2 = Ticket.create!(title: "Ticket 2", created_at: 2.hours.ago)
      ticket3 = Ticket.create!(title: "Ticket 3", created_at: 1.day.ago)

      tickets_in_period = Ticket.for_period(start_date, end_date)

      expect(tickets_in_period).to include(ticket1, ticket2)
      expect(tickets_in_period).not_to include(ticket3)
    end

    it "returns no tickets if none are in the period" do
      start_date = Time.zone.now.beginning_of_day
      end_date = Time.zone.now.end_of_day
      Ticket.create!(title: "Ticket", created_at: 2.days.ago)

      tickets_in_period = Ticket.for_period(start_date, end_date)

      expect(tickets_in_period).to be_empty
    end
  end

  describe ".diff_from_previous_day" do
    it "calculates the difference in tickets as a percentage when there are no tickets on the previous day" do
      Ticket.create!(title: "Today Ticket", created_at: Time.zone.now)

      difference = Ticket.diff_from_previous_day

      expect(difference).to eq(100.0)
    end
  end
end
