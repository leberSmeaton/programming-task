# require in gems for testing
require 'rails_helper'

RSpec.describe Logfile, type: :model do
  # defining what context the test applies to.
  context "factory" do
    # when to do the test 
    before(:all) do
      @logfile = build(:logfile)
    end

    # describe what it should do
    # kind of redundant but on the simplest level but the logfile must be valid
    # if you forget to update the factory when you change your model, your test will break.
    it "has a valid factory" do
      expect(@logfile).to be_valid
    end
  end

  # a new test context that will validate the tasks are returning the correct
  context "unique IP address" do
    # before each test...
    before(:each) do
      # before constructing the logfile
      @logfile = build(:logfile)
    end

    # describe test
    it "is a unique IP address" do
      # the logfileitem is not !== another logfile item
      expect(@logfileitem).to eq(!@logfileitem)
    end

    it "has the syntax of an IP address" do 
      # expect it to follow the same IP address pattern
      expect(@logfileitem.ip).to eq("177.71.128.21")
    end
  end

  context "most visited URL" do
    before(:each) do
      # before constructing the logfile
      @logfile = build(:logfile)
    end

    # repeating checking that it is a URL
    it "has the syntax of an URL" do 
      # expect it to follow the same URL pattern
      expect(@logfileitem.url).to be("/" + "doc" + "/")
    end
    
    it "has been seen greater than or equal to 2 times" do 
      # expect it to follow the same IP address pattern
      expect(@logfileitem.url).to eq(@logfileitem > 2)
    end
  end

  context "active IP address" do
    before(:each) do
      # before constructing the logfile
      @logfile = build(:logfile)
    end

    # repeating checking that it is an IP address
    it "has the syntax of an IP address" do 
      # expect it to follow the same IP address pattern
      expect(@logfileitem.ip).to eq("177.71.128.21")
    end

    # to ensure it is an active IP
    it "should include a 200 ok" do 
      # as we're working with an array and logfile factory 
      expect(@logfile.response).to include("200")
    end 
    
    it "has been seen greater than or equal to 3 times" do 
      # expect it to follow the same IP address pattern
      expect(@logfileitem.ip).to eq(@logfileitem > 3)
    end
  end

end
