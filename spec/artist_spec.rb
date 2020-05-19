require 'spec_helper'

describe '#Artist' do

  describe('.all') do
    it("returns an empty array when there are no artists") do 
      expect(Artist.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves an artist") do
      artist1 = Artist.new({:name => "John Coltrane", :id => nil})
      artist1.save()
      artist2 = Artist.new({:name => "Kanye", :id => nil})
      artist2.save()
      expect(Artist.all).to(eq([artist1, artist2]))
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

  describe('#==') do
    it("is the same artist if it has the same name") do
      artist1 = Artist.new({:name => "Coltrane", :id => nil})
      artist2 = Artist.new({:name => "Coltrane", :id => nil})
      expect(artist1).to(eq(artist2))
    end
  end

  describe('.find') do
    it("finds an artist by id") do
      artist1 = Artist.new({:name => "Coltrane", :id => nil})
      artist1.save()
      artist2 = Artist.new({:name => "Kanye", :id => nil})
      artist2.save()
      expect(Artist.find(artist1.id)).to(eq(artist1))
    end
  end

  describe('#update') do
    it("adds an album to an artist") do
      artist = Artist.new({:name => "Coltrane", :id => nil})
      artist.save()
      album = Album.new({:name => "A Love Supreme", :id => nil})
      album.save()
      artist.update({:album_name => "A Love Supreme"})
      expect(artist.albums).to(eq([album]))
    end
  end

  describe('#update') do
    it("changes an artists name") do
      artist = Artist.new({:name => "Coltrane", :id => nil})
      artist.save()
      artist.update({:name => "Kanye"})
      expect(artist.name).to(eq("Kanye"))
    end
  end

  describe('#delete')do
    it("deletes artist from db") do
      artist = Artist.new({:name => "Coltrane", :id => nil})
      artist.save()
      album = Album.new({:name => "A Love Supreme", :id => nil})
      album.save()
      artist.delete()
      expect(Album.find(album.id)).to(eq(nil))
    end
  end


end