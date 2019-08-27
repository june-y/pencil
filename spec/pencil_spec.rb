require 'pencil'
require 'paper'

RSpec.describe Pencil do
  let(:numbertwo) { Pencil.new(200,50,3) }
  let(:ruled_note) { Paper.new }



  context "when something needs to be written" do
    it "can be written" do
      paper = "Dog"
      numbertwo = Pencil.new(200,50,3)
      numbertwo.write("    bird",paper)
      expect((numbertwo.write("    bird",ruled_note).to eq(ruled_note.read("Dog    bird"))))
    end
  end


  context "when something needs to be erased" do
    it "can use the eraser for the last occurence of that text, converting to whitespace" do
      expect((numbertwo.erase("bird",ruled_note).to eq()))
      paper = "Dog    bird"
      numbertwo = Pencil.new(200,50,3)
      numbertwo.use_eraser("ird",paper)
      expect(paper).to eq("Dog    b   ")
    end
  end

    context "when something needs to be erased" do
    it "can use the eraser for the last occurence of that text, converting to whitespace" do
      expect((numbertwo.erase("bird",ruled_note).to eq()))
      paper = "How much wood would a woodchuck chuck if a woodchuck could chuck wood?"
      numbertwo = Pencil.new(200,50,3)
      numbertwo.use_eraser("chuck",paper)
      expect(paper).to eq("How much wood would a woodchuck chuck if a woodchuck could       wood?")
    end
  end




  context "when pencil point durability needs to go up" do
    it "can be sharpened" do
    end
  end

  context "if eraser_durability is low " do
    it "will erase until 0, and then stop erasing" do
    end
  end

  context "when pencil point is changed by sharpening" do
    it "can be set to a value higher than current value" do
    end
  end


  context "when pencil point is changed by writing" do
    it "will be set to a value lower" do
      paper = "Dog"
      numbertwo.write("    bird",paper)
      expect(numbertwo.point_durability).to eq(46)
    end
  end

    context "when pencil point is changed by writing" do
    it "will degrade by two with capitals, and one for lowercase" do
    end
  end

end
