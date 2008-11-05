require 'pathname'
require Pathname(__FILE__).dirname + 'spec_helper'

require 'bounded_async_task_runner'

describe BoundedAsyncTaskRunner do
  before do
    @runner = BoundedAsyncTaskRunner.new(5)
  end

  describe "#do(&block)" do
    it "should run tasks" do
      out = Array.new

      @runner.do(out) {|out| out << :marker}
      @runner.wait_for_all_to_finish

      out.should == [:marker]
    end 

    it "should run jobs as the same time" do
      out = Array.new
      
      @runner.do(out) {|out| sleep(0.1); out << :a}
      @runner.do(out) {|out| out << :b}
      
      @runner.wait_for_all_to_finish
      out.should == [:b, :a]
    end 

    it "should raise exception if any tasks fail" do
      lambda {
        @runner.do { raise ArgumentError, "testing" }
        @runner.wait_for_all_to_finish
      }.should raise_error(AsyncTaskError, "Worker error: testing (ArgumentError)")
    end 

    it "should included exception raised by task AsyncTaskError exception" do
      exception = ArgumentError.new("testing")
      @runner.do(exception) { raise(exception) }
      begin
        @runner.wait_for_all_to_finish
      rescue AsyncTaskError => e
        e.cause.should == exception
      end
    end 

    it "should not run more than the max number of tasks at any one moment" do
      # I don't know how to test this...
    end 
  end

  describe "#wait_for_all_to_finish" do
    it "should not return until all tasks are finished" do
      out = Array.new
      
      3.times do 
        @runner.do(out) {|out| sleep(0.1); out << :a}
      end
      @runner.wait_for_all_to_finish

      out.should == [:a, :a, :a]
    end 
  end 
end 
