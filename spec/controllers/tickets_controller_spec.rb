require 'rails_helper'

RSpec.describe TicketsController, type: :controller do
  describe "GET #index" do
    before do
      @ticket1 = Ticket.create!(title: "Ticket 1", created_at: 1.day.ago)
      @ticket2 = Ticket.create!(title: "Ticket 2", created_at: Time.zone.now)
      @ticket3 = Ticket.create!(title: "Ticket 3", created_at: 2.days.ago)
    end

    context "when no start_date and end_date are provided" do
      it "returns all tickets" do
        get :index
        expect(assigns(:tickets)).to contain_exactly(@ticket1, @ticket2, @ticket3)
      end
    end

    context "when start_date and end_date are not provided" do
      it "does not filter tickets and returns all tickets" do
        get :index
        expect(assigns(:tickets)).to contain_exactly(@ticket1, @ticket2, @ticket3)
      end
    end
  end
end
