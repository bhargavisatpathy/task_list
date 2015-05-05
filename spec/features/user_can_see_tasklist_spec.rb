require 'rails_helper'

RSpec.feature 'UserTasklists', type: :feature do

  it 'can see unarchived tasklists' do
    tasklist1 = create(:tasklist)
    tasklist2 = create(:tasklist, title: 'tasklist2', archived: true)
    visit '/'

    expect(page).to have_content('Task Lists')
    expect(page).to have_link('tasklist1')
  end

  it 'can create a tasklist' do
    visit '/'
    expect(page).to have_button('Create Tasklist')

    click_link_or_button('Create Tasklist')
    expect(page).to have_content('Create a New Tasklist Here')
  end

  it 'can rename a tasklist' do
    tasklist1 = create(:tasklist)
    visit '/'

    click_link_or_button('Rename Tasklist')
    expect(page).to have_content('Rename Task List')

    fill_in "tasklist[title]", with: "new_title"
    click_link_or_button("Submit")
    expect(page).to have_content('new_title')
  end

  it 'can see archived tasklists' do
    tasklist1 = create(:tasklist, title: "tasklist", archived: true)

    visit '/'
    click_link_or_button('Archived Tasklist')
    expect(page).to have_content('tasklist')
  end

  it 'can delete an archived tasklist' do
    tasklist1 = create(:tasklist, title: "tasklist", archived: true)

    visit '/'
    click_link_or_button('Archived Tasklist')
    click_link_or_button('Delete Task')
    expect(page).to have_no_content('tasklist')
  end

  xit 'can create a task' do
    visit '/'
    click_link_or
    expect(page).to have_button('Create Task')

    click_link_or_button('Create Task')
    expect(page).to have_content('Create a New Task Here')
  end


end
