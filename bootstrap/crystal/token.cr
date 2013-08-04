require "location"

module Crystal
  class Token
    attr_accessor :type
    attr_accessor :value
    attr_accessor :number_kind
    attr_accessor :string_end
    attr_accessor :string_nest
    attr_accessor :string_open_count
    attr_accessor :line_number
    attr_accessor :column_number
    attr_accessor :filename

    def initialize
      @string_end = '\0'
      @string_nest = '\0'
      @string_open_count = 0
    end

    def location
      Location.new(line_number, column_number, filename)
    end

    def token?(token)
      @type == :TOKEN && @value == token
    end

    def keyword?(keyword)
      @type == :IDENT && @value == keyword
    end

    def to_s
      @value ? @value.to_s : @type.to_s
    end
  end
end
