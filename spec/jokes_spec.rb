require_relative '../lib/jokes.rb'

describe Jokes do
  let(:x) { Jokes.new }
  describe "#get_jokes" do
    it "returns an array" do
      expect(x.get_joke.class).to eql(Array)
    end
    it "returns an array made of a String" do
      expect(x.get_joke[0].class).to eql(String)
    end
    it "returns an array made of a Number" do
      expect(x.get_joke[1].class).to be(Fixnum)
    end
  end
end
