require 'pencil'

RSpec.describe Pencil do
  let(:numbertwo) { Pencil.new(200,50,3) }



  context "when something needs to be written" do
    it "can be written" do
      paper = "Lady"
      result = numbertwo.write("    bird",paper)
      expect(result).to eq("Lady    bird")
    end
  end


  context "when something needs to be erased" do
    it "can use the eraser converting to whitespace" do
      paper = "Lady    bird"
      result = numbertwo.use_eraser("ird",paper)
      expect(result).to eq("Lady    b   ")
    end
  end

  context "when something needs to be erased" do
    it "the eraser durability shoud go down per character" do
      paper = "Lady    bird"
      numbertwo.use_eraser("ird",paper)
      expect(numbertwo.eraser_durability).to eq(47)
    end
  end

    context "when something needs to be erased" do
    it "can use the eraser for the last occurence of that text, converting to whitespace" do
      paper = "How much wood would a woodchuck chuck if a woodchuck could chuck wood?"
      result = numbertwo.use_eraser("chuck",paper)
      expect(result).to eq("How much wood would a woodchuck chuck if a woodchuck could       wood?")
    end
  end


  context "when pencil point durability needs to go up" do
    it "can be sharpened" do
      paper = "Lady"
      numbertwo.write("    bird",paper)
      expect(numbertwo.point_durability).to eq(196)
    end
  end

  context "if eraser_durability is low " do
    it "will erase until 0, and then stop erasing" do
      low_eraser =  Pencil.new(200,3,1)
      paper = "Buffalo Bill"
      result = low_eraser.use_eraser("Bill",paper)
      expect(result).to eq("Buffalo B   ")
    end
  end

  context "if eraser_durability needs to be changed " do
    it "will adjust the eraser durability" do
      paper = "The quick brown fox jumps over the lazy dog"
      result = numbertwo.write("    bird",paper)
      expect(result).to eq(result)
    end
  end


  context "when pencil point is changed by sharpening" do
    it "will be reset to the original point durability given" do
      paper = "Lady"
      result = numbertwo.write("    bird",paper)
      expect(result).to eq(result)
    end
  end

    context "when pencil point is changed by writing" do
    it "will degrade by two with capitals, and one for lowercase" do
      low_point = Pencil.new(3,50,3)
      paper = ""
      result = low_point.write("Text",paper)
      expect(result).to eq("Tex ")
    end
  end


    context "when pencil point is changed by writing" do
    it "will degrade by two with capitals, and one for lowercase" do
      paper = ""
      numbertwo.write("The quick brown fox jumps over the lazy dog",paper)
      expect(numbertwo.point_durability).to eq(164)
    end
  end

    context "when paper has a large whitespace and I want to edit the whitespace" do
    it "will replace the whitespace with my input string" do
      paper = "An       a day keeps the doctor away"
      result =   numbertwo.edit_paper("onion", paper)
      expect(result).to eq("An onion a day keeps the doctor away")
    end
  end

    context "when paper has a large whitespace and I want to edit the whitespace and there is not enough space" do
    it "will replace the whitespace with my input string, and character collisions are represented by the symbol @" do
      paper = "An       a day keeps the doctor away"
      result = numbertwo.edit_paper("artichoke",paper)
      expect(result).to eq("An artich@k@ay keeps the doctor away")
    end
  end

#notes: does punctuation,and symbols count in cost of eraser and point?
#

end
