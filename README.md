# Ruby Warrior (i18n-ed version)

This is a game designed to teach the Ruby language and artificial intelligence in a fun, interactive way.

You play as a warrior climbing a tall tower to reach the precious Ruby at the top level. On each floor you need to write a Ruby script to instruct the warrior to battle enemies, rescue captives, and reach the stairs. You have some idea of what each floor contains, but you never know for certain what will happen. You must give the Warrior enough artificial intelligence up-front to find his own way.

**NOTE**: The player directory structure changed on July 18, 2009. If you have an old profile using the "level-00*" structure then move the contents of the last level into the parent directory.

# i18n-ed version

This is an exact copy of the Ryan Bates' game but I implemented [i18n](http://en.wikipedia.org/wiki/Internationalization_and_localization) to be easily translated and to use it in [KidsRuby](https://github.com/hybridgroup/kidsruby).

This version includes english as one of the currently supported languages, so `rubywarriorwarrior-i18n` in english and the official game are exactly the same.

Currently supported languages:

* English
* Spanish

If you want to translate `ruby-warrior-i18n` to your native language feel free to do it, here are the instructions:

* Fork this repo
* Create a topic branch named after the name of your language in english (ie. japanese, german, french)
* Create a yml file in the `i18n/` folder named after your languages' [two-letter code](http://en.wikipedia.org/wiki/List_of_ISO_639-1_codes#Partial_ISO_639_table)
* Run `rubywarrior` using your language, e.g. `$ LANG=es ./bin/rubywarrior`
* Make a pull request

ruby-warrior-i18n takes advantage of the R18n-desktop gem to select the language from the user locales, if you want to test with a different language without specifying the `LANG` environment variable, here's how to change them:

### Mac OS X

Drag the language to the top of the list in:

	System Preferences > Languages and Text > Language tab

### Linux

	?
	
### Windows

	?

## Getting Started

First install the gem.

	gem install rubywarrior-i18n

Then run the `rubywarrior` command to setup your profile. This will create a `rubywarrior/` directory in your current location where you will find a `player.rb` file in your profile's directory containing this:

	class Player
	  def play_turn(warrior)
	    # your code goes here
	  end
	end

Your objective is to fill this `play_turn` method with commands to instruct the warrior what to do. With each level your abilities will grow along with the difficulty. See the `README` in your profile's directory for details on what abilities your warrior has available on the current level.

Here is a simple example which will instruct the warrior to attack if he feels an enemy, otherwise he will walk forward.

	class Player
	  def play_turn(warrior)
	    if warrior.feel.enemy?
	      warrior.attack!
	    else
	      warrior.walk!
	    end
	  end
	end

Once you are done editing `player.rb`, save the file and run the `rubywarrior` command again to start playing the level. The play happens through a series of turns. On each one, your `play_turn` method is called along with any enemy's.

You cannot change your code in the middle of a level. You must take into account everything that may happen on that level and give your warrior the proper instructions from the start.

Losing all of your health will cause you to fail the level. You are not punished by this, you simply need to go back to your `player.rb`, improve your code, and try again.

Once you pass a level (by reaching the stairs), the profile `README` will be updated for the next level. Alter the `player.rb` file and run `rubywarrior` again to play the next level.

## Scoring

Your objective is to not only reach the stairs, but to get the highest score you can. There are many ways you can earn points on a level.

* defeat an enemy to add his max health to your score
* rescue a captive to earn 20 points
* pass the level within the bonus time to earn the amount of bonus time remaining
* defeat all enemies and rescue all captives to receive a 20% overall bonus

A total score is kept as you progress through the levels. When you pass a level, that score is added to your total.

Don't be too concerned about scoring perfectly in the beginning. After you reach the top of the tower you will be able to re-run the tower and fine-tune your warrior to get the highest score. See the Epic Mode below for details.

## Perspective

Even though this is a text-based game, think of it as two-dimensional where you are viewing from overhead. Each level is always rectangular in shape and is made up of a number of squares. Only one unit can be on a given square at a time, and your objective is to find the square with the stairs. Here is an example level map and key.

	 ----
	|C s>|
	| S s|
	|C @ |
	 ----

	> = Stairs
	@ = Warrior (20 HP)
	s = Sludge (12 HP)
	S = Thick Sludge (24 HP)
	C = Captive (1 HP)


## Commanding the Warrior

When you first start, your warrior will only have a few abilities, but with each level your abilities will grow. A warrior has two kinds of abilities: actions and senses.

An action is something that effects the game in some way. You can easily tell an action because it ends in an exclamation mark. Only one action can be performed per turn, so choose wisely. Here are some examples of actions.

	warrior.walk!
	  Move in given direction (forward by default).

	warrior.attack!
	  Attack the unit in given direction (forward by default).

	warrior.rest!
	  Gain 10% of max health back, but do nothing more.

	warrior.bind!
	  Bind unit in given direction to keep him from moving (forward by default).

	warrior.rescue!
	  Rescue a captive from his chains (earning 50 points) in given direction (forward by default).


A sense is something which gathers information about the floor. You can perform senses as often as you want per turn to gather information about your surroundings and to aid you in choosing the proper action. Senses do NOT end in an exclamation mark.

	warrior.feel
	  Returns a Space for the given direction (forward by default).

	warrior.health
	  Returns an integer representing your health.

	warrior.distance
	  Returns the number of spaces the stairs are away.

	warrior.listen
	  Returns an array of all spaces which have units in them.


Since what you sense will change each turn, you should record what information you gather for use on the next turn. For example, you can determine if you are being attacked if your health has gone down since the last turn.

## Spaces

Whenever you sense an area, often one or multiple spaces (in an array) will be returned. A space is an object representing a square in the level. You can call methods on a space to gather information about what is there. Here are the various methods you can call on a space.

	space.empty?
	  If true, this means that nothing (except maybe stairs) is at this location and you can walk here.

	space.stairs?
	  Determine if stairs are at that location

	space.enemy?
	  Determine if an enemy unit is at this location.

	space.captive?
	  Determine if a captive is at this location.

	space.wall?
	  Returns true if this is the edge of the level. You can't walk here.

	space.ticking?
	  Returns true if this space contains a bomb which will explode in time.

	space.golem?
	  Returns true if a golem is occupying this space.

You will often call these methods directly after a sense. For example, the "feel" sense returns one space. You can call "captive?" on this to determine if a captive is in front of you.

	warrior.feel.captive?

## Golem

Along your journey you may discover the ability to create a golem. This is a separate unit which you also control. The turn handling is done through a block. Here is an example.

	warrior.form! do |golem|
	  golem.attack! if golem.feel.enemy?
	end

Complex logic can be placed in this block just like in the player turn method. You may want to move the logic into its own class or create multiple classes for different types of golems. You can create multiple golems in a level, but each one will take half of the warrior's health.

## Epic Mode
  
Once you reach the top of the tower, you will enter epic mode. When running `rubywarrior` again it will run your current `player.rb` through all levels in the tower without stopping.

Your warrior will most likely not succeed the first time around, so use the `-l` option on levels you are having difficulty or want to fine-tune the scoring.

	rubywarrior -l 3

Once your warrior reaches the top again you will receive an average grade, along with a grade for each level. The grades from best to worst are S, A, B, C, D and F. Try to get S on each level for the ultimate score.

Note: I'm in the process of fine-tuning the grading system. If you find the "S" grade to be too easy or too difficult to achieve on a given level, please add an issue for this on GitHub.

## Tips

If you ever get stuck on a level, review the `README` documentation and be sure you're trying each ability out. If you can't keep your health up, be sure to `rest` when no enemy is around (while keeping an eye on your health). Also, try to use far-ranged weapons whenever possible (such as the bow).

Remember, you're working in Ruby here. Don't simply fill up the `play_turn` method with a lot of code. Organize it with methods and classes. The player directory is set up as a load path so you can include other ruby files from your `player.rb` file.

Senses are cheap, so use them liberally. Store the sensed information to help you better determine what actions to take in the future.

Running `rubywarrior` while you are in your profile directory will auto-select that profile so you don't have to each time.

If you're aiming for points, remember to sweep the area. Even if you're close to the stairs, don't go in until you've gotten everything (if you have the health). Use far-ranged senses (such as look and listen) to determine if there are any enemies left.

Make sure to try the different options you can pass to the `rubywarrior` command. Run `rubywarrior --help` to see them all.

## TODO

Implement i18n in cucumber and rspec tests