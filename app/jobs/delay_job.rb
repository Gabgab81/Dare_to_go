class DelayJob < ApplicationJob
  queue_as :default

  def perform(dare)
    puts "Job started"
    puts "I'm starting the fake job"
    puts "Dare id: #{dare.id}"
    puts "Dare user id: #{dare.user_id}"
    puts "Dare progress: #{dare.progress}"
    if dare.pending?
      puts "inside if"
      dare.progress = "failed"
      dare.save
      puts "Dare progress: #{dare.progress}"
    end
    puts "Job done"

  end

end
