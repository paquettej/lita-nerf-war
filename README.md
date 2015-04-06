[![Gem Version](https://badge.fury.io/rb/lita-nerf-war.svg)](http://badge.fury.io/rb/lita-nerf-war)

# lita-nerf-war

Nerf guns at work are great. Want to get someone's attention? Shoot them with a dart -- it works great. But eventually someone complains and the dart guns end up in a drawer somewhere. End of the fun, right? Wrong! 
Virtualization isn't just for servers any longer. Now you can virtualize your nerf war too!


## Installation

Add lita-nerf-war to your Lita instance's Gemfile:

``` ruby
gem "lita-nerf-war"
```

## Configuration

You don't need to configure anything to have a hyperlocal nerf war but where's the fun in that? While ```lita-nerf-war``` does provide an initial set of snarky results, you can increase the fun factor by customizing the messages by specifying your own set of messages.

Create a yaml file within your bot's directory structure and set ```config.handlers.nerf_war.target_file``` to the full path to that file: 

```
  # lita-nerf-war
  config.handlers.nerf_war.target_file = File.expand_path(File.join(File.dirname(__FILE__), "targets.yml"))
  config.handlers.nerf_war.custom_message_chance = 50

```

A sample yaml file might look like this:

```
en:
  lita:
    handlers:
      nerf_war:
        targets:
          - a hit in the head.
          - a shot to the heart. 
          - ...right in the arm.
          - ouch right in the eye! 
```

Add your own brand of wit and wisdom to the ```targets``` key.

Want to troll your coworkers? Make one of them miss most of the time by adding a ```specific_targets``` key:

```
en:
  lita:
    handlers:
      nerf_war:
        specific_targets:
          someuser:
            default:
              - "Never gonna give you up\nNever gonna let you down\nNever gonna run around and desert you..."
            jeff:
              - ... and misses!
        targets:
          - a hit in the head.
          - a shot to the heart. 
          - ...right in the arm.
          - ouch right in the eye! 
```

Note that ```someuser``` is a person's [Slack](https://slack.com/) username, while the target's name is whatever you want to match. On our team, we tend to refer to people by their first name, so that's how the targets are set up. Also note that ```someuser``` has a special default messages -- but you can specify more than one. The likelihood of a user's default messages being used versus one of the standard messages is controlled by ```config.handlers.nerf_war.custom_message_chance```. The default is 50 (50%).


## Usage

In a channel where your Lita bot is a member, the command ```nerf <user>```, and your bot will reply with a shooting message and a snarky result:
  
```nerf stewart```
  
will produce something like:

```<your user name> shoots a dart at Stewart: gun jammed```
    
You can also specify your favorite shooting device:

```nerf joe with a bazooka```
  
will produce something like:

```<your user name> shoots a bazooka at joe: ouch right in the eye!```
    
For those really intense fire fights,  you can throw a nuke:

```nuke everyone```
      

## History

0.1.5 Fixed weapon name detection. Now handles 'with a ' as well as 'with '
0.1.4 Added a 5-shot gatling gun. Triggered if the text after the target (e.g. 'with a ...') contains the word 'gatling'

0.1.3 Specified ruby version in gemspec

0.1.2 Initial public release

0.0.1 Very late night hacking sessions

0.0.0 this was a TCL script? WTF? Who does THAT?
      
## Contributing

Contributions are welcome! Here's a quick guide shamelessly cobbled together from other projects:

Fork, then clone the repo:

    git clone git@github.com:your-username/lita-nerf-war.git

Make your change. Add tests for your change. Make the tests pass:

    rake

Push to your fork and [submit a pull request][pr].

[pr]: https://github.com/snowmoonsoftware/lita-nerf-war/compare/

At this point you're waiting on me. I like to at least comment on pull requests
within three business days (and, typically, one business day). I may suggest
some changes or improvements or alternatives.

Some things that will increase the chance that your pull request is accepted:

* Write tests.
* Write a [good commit message][commit].

[commit]: http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html
      