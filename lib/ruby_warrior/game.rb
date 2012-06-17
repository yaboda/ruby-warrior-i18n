module RubyWarrior
  
  class Game
    
    def start
      UI.puts R18n.t.welcome
      
      if File.exist?(Config.path_prefix + '/.profile')
        @profile = Profile.load(Config.path_prefix + '/.profile')
      else
        if File.exist?(Config.path_prefix + "/ruby-warrior")
          FileUtils.mv(Config.path_prefix + '/ruby-warrior', Config.path_prefix + '/rubywarrior')
        end
        make_game_directory unless File.exist?(Config.path_prefix + '/rubywarrior')
      end
      
      if profile.epic?
        if profile.level_after_epic?
          go_back_to_normal_mode
        else
          play_epic_mode
        end
      else
        play_normal_mode
      end
    end
    
    def make_game_directory
      if UI.ask(R18n.t.directory.not_found)
        Dir.mkdir(Config.path_prefix + '/rubywarrior')
      else
        UI.puts R18n.t.directory.cannot_continue
        exit
      end
    end
    
    def play_epic_mode
      Config.delay /= 2 if Config.delay # speed up UI since we're going to be doing a lot here
      profile.current_epic_score = 0
      profile.current_epic_grades = {}
      if Config.practice_level
        @current_level = @next_level = nil
        profile.level_number = Config.practice_level
        play_current_level
      else
        playing = true
        while playing
          @current_level = @next_level = nil
          profile.level_number += 1
          playing = play_current_level
        end
        profile.save # saves the score for epic mode
      end
    end
    
    def play_normal_mode
      if Config.practice_level
        UI.puts R18n.t.practice_level.unable_not_in_epic_mode
      else
        if current_level.number.zero?
          prepare_next_level
          UI.puts R18n.t.first_level_generated(profile.directory_name)
        else
          play_current_level
        end
      end
    end
    
    def play_current_level
      continue = true
      current_level.load_player
      UI.puts R18n.t.level.starting(current_level.number)
      current_level.play
      if current_level.passed?
        if next_level.exists?
          UI.puts R18n.t.stairs.found
        else
          UI.puts R18n.t.end_of_game
          continue = false
        end
        current_level.tally_points
        if profile.epic?
          UI.puts final_report if final_report && !continue
        else
          request_next_level
        end
      else
        continue = false
        UI.puts R18n.t.level.failed(current_level.number)
        if !Config.skip_input? && current_level.clue && UI.ask(R18n.t.level.clues)
          UI.puts current_level.clue.hard_wrap
        end
      end
      continue
    end
    
    def request_next_level
      if !Config.skip_input? && (next_level.exists? ? UI.ask(R18n.t.level.continue_next) : UI.ask(R18n.t.level.continue_epic_mode))
        if next_level.exists?
          prepare_next_level
          UI.puts R18n.t.readme.see_updated(profile.directory_name)
        else
          prepare_epic_mode
          UI.puts R18n.t.to_play_epic_mode
        end
      else
        UI.puts R18n.t.level.staying_on_current
      end
    end
    
    def prepare_next_level
      next_level.generate_player_files
      profile.level_number += 1
      profile.save # this saves score and new abilities too
    end
    
    def prepare_epic_mode
      profile.enable_epic_mode
      profile.level_number = 0
      profile.save # this saves score too
    end
    
    def go_back_to_normal_mode
      profile.enable_normal_mode
      prepare_next_level
      UI.puts R18n.t.mode.back_to_normal
      UI.puts R18n.t.readme.see_updated(profile.directory_name)
    end
    
    
    # profiles
    
    def profiles
      profile_paths.map { |profile| Profile.load(profile) }
    end
    
    def profile_paths
      Dir[Config.path_prefix + '/rubywarrior/**/.profile']
    end
    
    def profile
      @profile ||= choose_profile
    end
    
    def new_profile
      profile = Profile.new
      profile.tower_path = UI.choose(R18n.t.game.tower, towers).path
      profile.warrior_name = UI.request(R18n.t.warrior.enter_name)
      profile
    end
    
    
    # towers
    
    def towers
      tower_paths.map { |path| Tower.new(path) }
    end
    
    def tower_paths
      Dir[File.expand_path('../../../towers/*', __FILE__)]
    end
    
    
    # levels
    
    def current_level
      @current_level ||= profile.current_level
    end
    
    def next_level
      @next_level ||= profile.next_level
    end
    
    def final_report
      if profile.calculate_average_grade && !Config.practice_level
        report = ""
        report << R18n.t.game.average_grade_for_tower(Level.grade_letter(profile.calculate_average_grade))
        profile.current_epic_grades.keys.sort.each do |level|
          report << "  #{R18n.t.level.number(level)} #{Level.grade_letter(profile.current_epic_grades[level])}\n"
        end
        report << R18n.t.level.to_practice
        report
      end
    end
    
    private
    
    def choose_profile # REFACTORME
      profile = UI.choose(R18n.t.profile.profile, profiles + [[:new, R18n.t.profile.new]])
      if profile == :new
        profile = new_profile
        if profiles.any? { |p| p.player_path == profile.player_path }
          if UI.ask(R18n.t.profile.replace_existing_for_tower)
            UI.puts R18n.t.profile.replace_existing
            profile
          else
            UI.puts R18n.t.profile.not_replacing
            exit
          end
        else
          profile
        end
      else
        profile
      end
    end
    
  end
end
