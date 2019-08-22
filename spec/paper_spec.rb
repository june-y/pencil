require 'paper'

RSpec.describe Paper do
  let(:ruled_note) { Paper.new }

  context "" do

  end

  context "when words need to be written" do
    it "the text is reflected on the paper" do
      expect(set_text).to eq(input)
    end
  end

  context "when evidence needs to be removed" do
    it "can be destroyed" do
      expect((ruled_note.destroy).to eq(NULL))
    end
  end

  context "when the paper exists" do
    it "can be read" do
      expect((ruled_note.read).to eq())
    end
  end

end
