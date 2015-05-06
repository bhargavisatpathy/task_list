require 'rails_helper'

RSpec.describe TasklistsController, type: :controller do

  describe "DELETE #destroy" do
    it "deletes the tasklist" do
      tasklist = create(:tasklist)
      delete :destroy, id: tasklist.id
      expect(Tasklist.count).to eq(0)
      expect(response).to redirect_to(tasklists_archived_path)
    end
  end
end
