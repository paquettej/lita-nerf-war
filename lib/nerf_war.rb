class NerfWar
  
  # set targets_for_eric { "and hits her in the forehead!" "ooooh THERE'S another free lunch!" " aaand THERE's another HR violation" "Never gonna give you up, Never gonna let you down,\
  #  Never gonna run around and desert you..." }
  #
  # set targets_for_todd { "peers through scope, adjusts for windage, exhales and holds still...HIT!" "dons Ghillie suit and is never seen again." "HIT! Hands them a tourniquet" "norma\
  # l"}
  #
  # set targets_for_jennifer {"... wait, I don't always shoot at Jeff, but when I do I usually miss... and misses!"}
  # set targets_for_jennifer_eric {"pew pew!" " right in the... oooh ouch" "and cringes in horror"}

  BURN_UNITS = 'http://en.wikipedia.org/wiki/List_of_burn_centers_in_the_United_States'
  FLAME_WEAPONS = ['flamethrower',  'napalm', 'willy pete', 'willie pete'] 
  
  def initialize(response, target, weapon)
    @response = response
    @user = @response.user
    @target = target
    @weapon = weapon
    @weapon = 'a dart' if weapon.nil? || weapon.empty?
    
    @generic_targets = I18n.translate('lita.handlers.nerf_war.targets')
  end
  
  def nerf
    
    return if you_will_put_your_eye_out?
    return if we_never_forget_vlad?
    return if eric_always_misses?
    
    @response.reply shooting_message + snarky_result   
    @response.reply BURN_UNITS if is_flame_weapon?
  end
  
  def nuke
    @response.reply ["#{@user.name} tosses a nuke into the room", "http://www.dudeiwantthat.com/omg/fools/nerf-nuke-12043.jpg"]
  end
  
  def snarky_result
    ' and ' + @generic_targets[rand(@generic_targets.length)]    
  end
  
  def shooting_message
    "#{@user.name} shoots #{@weapon} at #{@target}"
  end
  
  def eric_always_misses?
    if @user.name.downcase.start_with?('eric') && @target.downcase == 'jeff'
      @response.reply "#{shooting_message}... and misses!"
      return true
    end
    false
  end
  
  def we_never_forget_vlad?
    if @target.downcase == 'vlad'    
      @response.reply [shooting_message, "http://www.quickmeme.com/img/22/221f53ddeb8084c01d4d50c966df793d30b8392c68b7cb0a5ec50a635e01cff2.jpg"]
      return true
    end
    false
  end
  
  def you_will_put_your_eye_out?
    if is_self?
      @response.reply "You'll put your eye out!"
      return true
    end
    false    
  end
  
  def is_self?
    @user.name.downcase == @target.downcase
  end
  
  def is_flame_weapon?    
    FLAME_WEAPONS.include?(@weapon.downcase)  
  end
  
end