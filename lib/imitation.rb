require 'linguistics'
Linguistics::use(:en)

%w[ array string ].each {|f| require "core_ext/#{f}" }

module Imitation
  def method_missing(name, *args, &block)
    name_s   = name.to_s
    naked    = name_s.sub(/\?$/, '')
    plural   = naked.plural?
    pluraled = plural ? naked : naked.en.plural
    upcased  = pluraled.upcase

    if const_defined?(upcased)
      method = (plural and pluraled != pluraled.en.plural) ? 'subset' : 'rand' # 'carp' results rand
      module_eval <<-DEF, __FILE__, __LINE__
        def self.#{name_s}
          #{upcased}.#{method}#{'?' unless name_s == naked}
        end
      DEF
      __send__(name)
    else
      raise NameError, "#{upcased} is not defined for #{name_s}"
    end
  end
end
