require 'ostruct'

class Mizar
  class Config < OpenStruct

    # Get/Set the object to use for input by default by all Mizar instances.
    # @return [#readline] The object to use for input by default by all
    #   Mizar instances.
    attr_accessor :input
    
    # Get/Set the object to use for output by default by all Mizar instances.
    # @return [#puts] The object to use for output by default by all
    #   Mizar instances.
    attr_accessor :output
    
    # Get/Set the stack of input objects that a Mizar instance switches
    # to when its current input object encounters EOF.
    # @return [Array] The array of input objects.
    attr_accessor :input_stack
    
    
    # Config option for history.
    # sub-options include hist.file, hist.load, and hist.save
    # hist.file is the file to save/load history too, e.g
    # Mizar.config.history.file = "~/.mizpry_history".
    # hist.should_load is a boolean that determines whether history will be
    # loaded from hist.file at session start.
    # hist.should_save is a boolean that determines whether history will be
    # saved to hist.file at session end.
    # @return [OpenStruct]
    attr_accessor :history

    
    def set_config_defaults
      self.input = Readline
      self.output = $stdout
      self.input_stack = []
    
      self.history ||= OpenStruct.new
      self.history.should_save = true
      self.history.should_load = true
      self.history.file = File.expand_path("~/.mizpry_history")
    end

  end
end

