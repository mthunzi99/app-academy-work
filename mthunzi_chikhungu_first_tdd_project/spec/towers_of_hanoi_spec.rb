require 'towers_of_hanoi'
require 'rspec'

describe TowersOfHanoi do
  subject(:towers) { TowersOfHanoi.new }

  describe "#initialize" do
    it "sets 3 towers with the first tower having 3 disk" do
      expect(towers.stacks).to eq([[3,2,1], [], []])
    end
  end

  describe "#render" do
    it "displays the towers" do
      expect(towers.render).to eq("Tower 1: 3  2  1 \nTower 2:  \nTower 3:  ")
    end
  end

  describe "#move" do 
    it "allows a disk to move from one tower to another" do
      expect { towers.move(1,2) }.to_not raise_error
    end

    it "allows a smaller disk to move onto a bigger disk" do
      towers.move(1,2)
      towers.move(1,3)
      expect { towers.move(2,3) }.to_not raise_error
    end

    it "does not allow bigger disk to move onto smaller disk" do
      towers.move(1,2)
      expect { towers.move(1,2) }.to raise_error("Cannot move disk onto smaller disk")
    end

    it "does not allow moving from an empty tower" do
      expect {towers.move(2,1) }.to raise_error("Cannot move from an empty tower")
    end
  end

  describe "#won" do
    it "returns false when the game hasn't been won" do
      expect(towers).to_not be_won
    end

    it "returns true when all the disks are on the second tower" do
      towers.move(1, 2)
      towers.move(1, 3)
      towers.move(2, 3)
      towers.move(1, 2)
      towers.move(3, 1)
      towers.move(3, 2)
      towers.move(1, 2)

      expect(towers).to be_won
    end

    it "returns true when all the disks are on the third tower" do
      towers.move(1, 3)
      towers.move(1, 2)
      towers.move(3, 2)
      towers.move(1, 3)
      towers.move(2, 1)
      towers.move(2, 3)
      towers.move(1, 3)

      expect(towers).to be_won
    end
  end
end