require 'forwardable'

class Mizar
  # class accessors
  class << self
    extend Forwardable
    
    # for convenience only
    def self.delegate_accessors(delagatee, *names)
      def_delegators delagatee, *names
      def_delegators delagatee, *names.map { |v| "#{v}=" }
    end

    # @return [Boolean] Whether me was activated from the command line.
    attr_accessor :cli
    
    # @return [History] Return Mizpry's line history object.
    attr_accessor :history
    
    # @return [OpenStruct] Return Mizpry's config object.
    attr_accessor :config
    
    delegate_accessors :@config, :input, :output, :input_stack

  end
  
  
  # Basic initialization.
  # called upon requiring /lib/mizar.rb
  def self.init!
    self.config ||= Config.new
    self.history ||= History.new
    
    self.config.set_config_defaults
  end
  
  def self.start(options={})
    if @initial_session
      load_history if Pry.config.history.should_load
      @initial_session = false
    end
    
    # the code inside mizar_instance.rb will be executed then
    new(options).loop_it!
    
  end
    
  def self.load_history
    Pry.history.load(history_file) if File.exists?(history_file)
  end
  
  # Get the full path of the history_path for mizpry.
  def self.history_file
    File.expand_path(Mizar.config.history.file)
  end
  
end
