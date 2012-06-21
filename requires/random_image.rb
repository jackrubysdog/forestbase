class RandomImage
  
  def initialize
    @images = Array.new
    @images << {:image => "nf_otd.gif", :url => "http://www.amazon.co.uk/Nottingham-Forest-On-This-Day/dp/1905411898"}
    @images << {:image => "nf_m.gif", :url => "http://www.amazon.co.uk/Nottingham-Forest-Miscellany-Trivia-History/dp/1908051531"}
    @images << {:image => "nf_bcl.gif", :url => "http://www.ebay.co.uk/itm/Nottm-Forest-Complete-Record-1975-2010-football-book-/360373395059?pt=Non_Fiction&hash=item53e7ed9e73"}
    @idx = rand(3)
  end
  
  def image
    @image = @images[@idx][:image]
  end

  def url
    @image = @images[@idx][:url]
  end
end
