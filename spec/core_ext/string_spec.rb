require File.join(File.dirname(__FILE__), %w[ .. spec_helper])

{
  true  => %w[ boxes indices carp ],
  false => %w[ box   index ]
}.each do |result, words|
  words.each do |word|
    describe "#{word}.plural?" do
      subject { word.plural? }
      
      it { should == result }
    end
  end
end

