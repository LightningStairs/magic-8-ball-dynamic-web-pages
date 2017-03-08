require 'spec_helper'
feature "User submits a question" do
  # As a magic 8-ball user
  # I want to ask a question
  # So that I can know my future

  # Acceptance Criteria:

  # * When I supply text in the form I receive an answer from the magic 8 ball
  # * I must supply text. If I don't, I receive an error after hitting submit
  scenario 'supply text for the question form and receive an answer on the show page' do
    visit '/'
    fill_in 'Question', with: 'Will my partner make me a pie for my birthday?'
    click_button 'Submit'

    expect(page).to have_content("Your answer:")
    expect(page).to have_content('Will my partner make me a pie for my birthday?')
  end

  scenario 'do not text for the question form and receive an error message' do
   visit '/'
   click_button 'Submit'

   expect(page).to have_content("Error! " +
     "Please ask a question! Magic 8-Ball tells the future, it cannot read your mind!")
  end
end
