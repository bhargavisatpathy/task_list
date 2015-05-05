require 'rails_helper'

RSpec.describe TasklistsController, type: :controller do

  describe "DELETE #destroy" do
    xit "deletes the tasklist" do
      delete :destroy, id: tasklist.id
      expect(response).to redirect_to(tasklists_path)
    end
  end
end
