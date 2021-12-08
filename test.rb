# Require in for testing
require 'rails_helper'

RSpec.describe Logfile, type: :model do
  # Defining what context the test applies to.
  context "factory" do
    # When to do the test 
    before(:all) do
      @logfile = build(:logfile)
    end

    # Describe what it should do
    # "it has a valid factory" is kind of redundant but on the simplest level but the logfile must be valid
    # If you forget to update the factory when you change your model, your test will break.
    it "has a valid factory" do
      expect(@logfile).to be_valid
    end
  end

  # A new test context that will validate that the tasks are returning the correct IP address
  context "unique IP address" do
    # Before each test...
    before(:each) do
      # Before the build populates with the new instance
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

  # A test context that will expect that the tasks are returning a URL an expected number of times
  context "most visited URL" do
    before(:each) do
      # before constructing the logfile
      @logfile = build(:logfile)
    end

    # repeating checking that it is a URL
    it "has the syntax of an URL" do 
      # expect it to follow the same URL pattern
      # this url is the target file section of request section
      expect(@logfileitem.url).to be("/asset.css")
    end
    
    it "has been seen greater than or equal to 2 times" do 
      # expect it to follow the same IP address pattern
      expect(@logfileitem.url).to eq(@logfileitem > 2)
    end
  end

  # A test context that will expect that the IP is correct and active and that it is expected a number of times
  context "active IP address" do
    before(:each) do
      # before constructing the logfile
      @logfile = build(:logfile)
    end

    # repeating checking that it is an IP address
    it "has the syntax of an IP address" do 
      # expect it to follow the same IP address pattern
      expect(@logfileitem.ip).to eq("50.112.00.11")
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
