require 'optparse'

module RubyWarrior
  class Runner
    def initialize(arguments, stdin, stdout)
      @arguments = arguments
      @stdin = stdin
      @stdout = stdout
      @game = RubyWarrior::Game.new
    end
    
    def run
      Config.in_stream = @stdin
      Config.out_stream = @stdout
      Config.delay = 0.6
      parse_options
      @game.start
    end
    
    private
    
    def parse_options
      t = R18n.t.runner.options
      options = OptionParser.new 
      options.banner = t.banner
      options.on('-d', '--directory DIR', t.directory)  { |dir| Config.path_prefix = dir }
      options.on('-l', '--level LEVEL',   t.level)      { |level| Config.practice_level = level.to_i }
      options.on('-s', '--skip',          t.skip)       { Config.skip_input = true }
      options.on('-t', '--time SECONDS',  t.time)       { |seconds| Config.delay = seconds.to_f }
      options.on('-h', '--help',          t.help)       { puts(options); exit }
      options.parse!(@arguments)
    end
  end
end
