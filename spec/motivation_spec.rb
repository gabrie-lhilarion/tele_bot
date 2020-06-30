require_relative '../lib/motivation.rb'  

describe Motivate do
  let(:x){ Motivate.new }
    describe "#make_the_request" do
      it "returns a hash" do
       expect(x.make_the_request.class).to eql(Array)
      end
    end
   
    describe "#select_random" do
      it "return a Hash" do
      expect(x.select_random.class).to eql(Hash) 
      end
      it "returns a long String" do
       expect(x.select_random['text'].class).to eql(String)
      end
    end
end