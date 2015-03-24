# lita-nerf-war

Nerf guns at work are great. Want to get someone's attention? Shoot them with a dart -- tt works great. But eventually someone complains and the dart guns end up in a drawer somewhere. End of the fun right? Wrong! 
Virtualization isn't just for servers any longer. Now you can virtualize your nerf war too!


## Installation

Add lita-nerf-war to your Lita instance's Gemfile:

``` ruby
gem "lita-nerf-war"
```

## Configuration

You don't need to configure anything to have your very own nerf war but where's the fun in that? While lita-nerf-war does provide an initial set of snarky results, you can increase the fun factor by customizing the messages by specifying your own set of messages.

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
      