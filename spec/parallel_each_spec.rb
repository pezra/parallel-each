require File.dirname(__FILE__) + "/spec_helper"
require 'parallel_each'

describe '#p_each' do 
  it "should execute block for each item" do 
    i = 0
    %w(this that).p_each {i+=1}
    i.should eql(2)
  end

  it "should execute items in parallel" do
    results = []
    [2, 1].p_each{|i| sleep i; results << i}
    results.should eql([1, 2])
  end
end
