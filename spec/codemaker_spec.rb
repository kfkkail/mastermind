require 'codemaker'

describe CodeMaker do
  codemaker1 = CodeMaker.new()
  describe ".initalize" do
    context "when making a new object" do
      it "a CodeMaker object exists" do
        expect(codemaker1.is_a? CodeMaker).to eql(true)
      end
    end
  end
  
  describe ".create_code" do
    context "with no input" do
      it "sets the code to something other than nil" do
        codemaker1.create_code
        expect(codemaker1.code).not_to eql([nil,nil,nil,nil])
      end
    end
  end
  
  describe ".win_test" do
    context "with codes matching" do
      it "should show a match for win" do
        expect(codemaker1.win_test(codemaker1.code)).to eql([:b, :b, :b, :b])
      end
    end
    
    context "with 3 positions matching" do
      it "should return 3 :b" do
        codemaker1.code = [1, 2, 3, 4]
        guess =           [1, 2, 3, 5]
        expect(codemaker1.win_test(guess)).to eql([:b, :b, :b, :z])
      end
    end
    context "with 2 positions matching" do
      it "should return 2 :b" do
        codemaker1.code = [1, 2, 3, 4]
        guess =           [1, 2, 5, 5]
        expect(codemaker1.win_test(guess)).to eql([:b, :b, :z, :z])
      end
    end
    context "with 1 position matching" do
      it "should return 1 :b" do
        codemaker1.code = [1, 2, 3, 4]
        guess =           [1, 5, 5, 5]
        expect(codemaker1.win_test(guess)).to eql([:b, :z, :z, :z])
      end
    end
    context "with 1 position matching" do
      it "should return 1 :b" do
        codemaker1.code = [1, 2, 3, 4]
        guess =           [1, 3, 2, 5]
        expect(codemaker1.win_test(guess)).to eql([:b, :w, :w, :z])
      end
    end
    context "with 1 position matching and 1 included" do
      it "should return 1 :b 1 :w" do
        codemaker1.code = [1, 2, 3, 4]
        guess =           [1, 5, 2, 2]
        expect(codemaker1.win_test(guess)).to eql([:b, :w, :z, :z])
      end
    end
    context "with 1 included" do
      it "should return 1 :w" do
        codemaker1.code = [1, 2, 3, 4]
        guess =           [2, 5, 2, 2]
        expect(codemaker1.win_test(guess)).to eql([:w, :z, :z, :z])
      end
    end
    context "with 4 included" do
      it "should return 4 :w" do
        codemaker1.code = [1, 2, 3, 4]
        guess =           [4, 3, 2, 1]
        expect(codemaker1.win_test(guess)).to eql([:w, :w, :w, :w])
      end
    end
  end
end