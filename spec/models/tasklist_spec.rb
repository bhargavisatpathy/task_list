require 'rails_helper'

RSpec.describe Tasklist, type: :model do
  it "is valid" do
    tasklist = create(:tasklist)
    expect(tasklist).to be_valid
  end

  it "is invalid without a title" do
    tasklist = create(:tasklist)

    tasklist.title = nil
    expect(tasklist).not_to be_valid
  end

  it "has many tasks" do
    tasklist = create(:tasklist)
    task1 = create(:task, tasklist_id: tasklist.id)
    task2 = create(:task, title: "title2", description: "description2", tasklist_id: tasklist.id)

    expect(tasklist.tasks.count).to eq(2)
    expect(tasklist.tasks[1].title).to eq("title2")
  end
end
