class Mizar

  attr_accessor :input
  attr_accessor :output
  attr_accessor :input_stack
  
  # Create a new `Mizar` object.
  # @param [Hash] options The optional configuration parameters.
  # @option options [#readline] :input The object to use for input.

  def initialize(options={})
    refresh(options)

    @command_processor = CommandProcessor.new(self)
    @binding_stack     = []
    @indent            = Pry::Indent.new
  end


  # Refresh the instance settings from the class.
  # Allows options to be specified to override settings from the class.
  # @param [Hash] options The options to override the class settings
  #   for this instance.
  def refresh(options={})
    defaults   = {}
    attributes = [
                   :input, :output, :input_stack
                 ]

    attributes.each do |attribute|
      defaults[attribute] = Pry.send attribute
    end

    defaults.merge!(options).each do |key, value|
      send "#{key}=", value
    end

    true
  end
  
  def loop_it!
    loop do
      
    end
  end
end
