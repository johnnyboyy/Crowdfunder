require 'spec_helper'

describe "My::ProjectFlows" do
  describe "GET /my_project_flows" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get my_project_flows_index_path
      response.status.should be(200)
    end
  end
end
