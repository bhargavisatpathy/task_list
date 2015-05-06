require 'rails_helper'

RSpec.describe TasklistsController, type: :controller do

  describe "GET #index" do
    it "can display tasklists" do
      tasklist = create(:tasklist)
      get :index
      expect(Tasklist.count).to eq(1)
      expect(response).to render_template("index")
    end
  end

  describe "POST #create " do
    it "can create tasklist" do
      post :create, tasklist: { title: "Title" }

      expect(Tasklist.count).to eq(1)
      expect(response).to redirect_to(root_path)
    end
  end

  describe "GET #show " do
    it "can display tasks in tasklist" do
      tasklist = create(:tasklist)
      task = create(:task, tasklist_id: tasklist.id)
      get :show, id: tasklist.id

      expect(tasklist.tasks.count).to eq(1)
      expect(response).to render_template("show")
    end
  end

  describe "GET #archived " do
    it "can display archived tasklist" do
      tasklist_archived = create(:tasklist, archived: true)
      tasklist = create(:tasklist)
      get :archived

      expect(Tasklist.archived.count).to eq(1)
      expect(response).to render_template("archived")
    end
  end

  describe "POST #edit" do
    it "renames tasklist" do
      tasklist = create(:tasklist)
      get :edit, id: tasklist.id
      expect(response).to render_template(:edit)

      post :update, id: tasklist.id, tasklist: { title: "New Title" }
      expect(response).to redirect_to(root_path)
    end
  end

  describe "DELETE #destroy" do
    it "deletes the tasklist" do
      tasklist = create(:tasklist)
      delete :destroy, id: tasklist.id
      expect(Tasklist.count).to eq(0)
      expect(response).to redirect_to(tasklists_archived_path)
    end
  end
end
