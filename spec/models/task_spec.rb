require 'rails_helper'

RSpec.describe Task, type: :model do
  it "is valid" do
    task = create(:task)
    expect(task).to be_valid
  end

  it "is invalid without a title" do
    task = create(:task)

    task.title = nil
    expect(task).not_to be_valid
  end
end
