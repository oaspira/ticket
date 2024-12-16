10.times do |i|
  Ticket.create!(
    title: "Ticket #{i + 1}",
    description: "Descrição para o ticket #{i + 1}",
    created_at: Faker::Date.between(from: 30.days.ago, to: Date.today)
  )
end
