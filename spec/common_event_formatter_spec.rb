require "spec_helper"
require "common_event_formatter"

describe "CommonEventFormatter" do

  describe "VERSION" do
    subject { CommonEventFormatter::VERSION }
    it { should be_a String }
  end

  subject { CommonEventFormatter.new }

  describe "call" do
    before do
      @severity = "INFO"
      @time = Time.now
      @progname = "testing"
      @msg = "This is a test log"
    end
    it "should load call create_event with a hash" do
      subject.should_receive(:pwd).and_return("test_app")
      subject.should_receive(:hostname).and_return("server.test.com")
      subject.should_receive(:create_event).with({:level => @severity, :time => @time, :host => "server.test.com", :app => "test_app", :pname => @progname, :msg => @msg})
      subject.call(@severity, @time, @progname, @msg)
    end
  end

  describe "create_event" do
    before do
      @severity = "INFO"
      @time = Time.now
      @progname = "testing"
      @msg = "This is a test log"
      @host = "server.test.com"
      @app = "test_app"
      @hash = {:level => @severity, :time => @time, :host => @host, :app => @app, :pname => @progname, :msg => @msg}
    end
    it "should call process_hash" do
      subject.should_receive(:process_hash).and_return({})
      subject.create_event(@hash)
    end
    it "should output json and a new line" do
      json = subject.create_event(@hash)
      object = JSON.parse(json, :symbolize_names => true)
      object[:level].should == "INFO"
      object[:app].should == "test_app"
    end
  end

end
