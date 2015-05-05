require 'rails_helper'

RSpec.feature 'UserTasklists', type: :feature do

  describe 'Tasklist Management' do
    it 'can see unarchived tasklists' do
      tasklist1 = create(:tasklist)
      tasklist2 = create(:tasklist, title: 'tasklist2', archived: true)
      visit '/'

      expect(page).to have_content('Task Lists')
      expect(page).to have_link('tasklist1')
      expect(page).to have_no_link('tasklist2')
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

    it 'can archive a tasklist' do
      tasklist1 = create(:tasklist)

      visit '/'
      expect(page).to have_button('Archive')

      click_link_or_button('Archive')
      expect(page).to have_no_content('tasklist')
    end
  end

  describe 'Task Management' do
    it 'can create a task' do
      tasklist1 = create(:tasklist, title: "tasklist1")
      visit '/'
      click_link_or_button("tasklist1")
      expect(page).to have_button('Create Task')

      click_link_or_button('Create Task')
      expect(page).to have_content('Create a New Task Here')
      fill_in "task[title]", with: "new_title"
      fill_in "task[description]", with: "new_description"
      # click_link_or_button("Submit")
      # expect(page).to have_content("tasklist1")
    end

    it 'can edit a task' do
      tasklist1 = create(:tasklist, title: "tasklist1")
      task1 = create(:task, tasklist_id: tasklist1.id)
      visit '/'
      click_link_or_button("tasklist1")
      expect(page).to have_button('Edit Task')

      click_link_or_button('Edit Task')
      expect(page).to have_content('Edit Task')
    end

    it 'can delete a task' do
      tasklist1 = create(:tasklist, title: "tasklist1")
      task1 = create(:task, tasklist_id: tasklist1.id)
      visit '/'

      click_link_or_button("tasklist1")
      expect(page).to have_button('Delete Task')

      click_link_or_button('Delete Task')
      expect(page).to have_no_content('task1')
    end
  end
end
