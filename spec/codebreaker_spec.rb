require 'codebreaker'

describe CodeBreaker do
  codebreaker1 = CodeBreaker.new()
  describe ".initalize" do
    context "when making a new object" do
      it "a CodeBreaker object exists" do
        expect(codebreaker1.is_a? CodeBreaker).to eql(true)
      end
    end
  end
  
  describe ".guess" do
    context "get a code from the user" do
      it "gets the code and returns it" do
        codebreaker1.stub(:gets) { "1234\n" }
        expect(codebreaker1.guess).to eql([1,2,3,4])
      end
    end
  end
end