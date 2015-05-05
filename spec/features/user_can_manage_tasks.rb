require 'rails_helper'

RSpec.feature 'ManageTask', type: :feature do

  it 'can create a task' do
    visit '/'
    click_link_or
    expect(page).to have_button('Create Task')

    click_link_or_button('Create Task')
    expect(page).to have_content('Create a New Task Here')
  end

  it 'can edit a task' do
    skip
    task1 = create(:task)
    visit '/'

    click_link_or_button('Edit Task')
    expect(page).to have_content('Edit Task Here')
  end

  it 'can delete a task' do
    task1 = create(:task)
    visit '/'

    click_link_or_button('Delete Task')
    expect(page).to have_no_content('task1')
  end

end
