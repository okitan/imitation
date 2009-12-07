class String
  # I'm wondering the interface of linguistic, but I don't wanna use ActiveSupport
  # 'box'.en.plural        #=> 'boxes'
  # 'box'.en.plural_noun   #=> 'boxes'
  # 'boxes'.en.plural      #=> 'box'
  # 'boxes'.en.plural_noun #=> 'boxess'
  # 'carp'.en.plural       #=> 'carp'
  # 'carp'.en.plural_noun  #=> 'carp'
  # See spec.
  def plural?
    if self == self.en.plural # e.g. carp
      true
    else
      self.en.plural == self.en.plural_noun ? false : true
    end
  end
end
