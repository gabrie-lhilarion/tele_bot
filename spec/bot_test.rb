require_relative '../lib/qoute_bot.rb'
require_relative '../lib/motivation.rb'  


describe Motivate do
    let(:x)= { Motivate.new }
    describe "#make_the_request" do
        it "returns a hash" do 
           expect(x.make_the_request).to eql(Hash) 
        end     
    end

  describe "#select_random" do

  end 
end