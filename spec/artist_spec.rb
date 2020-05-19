require 'spec_helper'

describe '#Artist' do

  describe('.all') do
    it("returns an empty array when there are no artists") do 
      expect(Artist.all).to(eq([]))
    end
  end

  describe('.clear') do
    it("clears all artists") do
      artist = Artist.new({:name => "John Coltrane", :id => nil})
      artist.save()
      artist2 = Artist.new({:name => "Kanye", :id => nil})
      artist2.save()
      Artist.clear
      expect(Artist.all).to(eq([]))
    end
  end

end