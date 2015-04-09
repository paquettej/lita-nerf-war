class NerfWar
  
  BURN_UNITS = 'http://en.wikipedia.org/wiki/List_of_burn_centers_in_the_United_States'
  FLAME_WEAPONS = ['flamethrower', 'flame thrower' 'napalm', 'willy pete', 'willie pete'] 
  SCRUM_BUTS = ['scrum but', 'scrum butt', 'scrumbut', 'scrum-but', 'scrum-butt']
  
  def initialize(response, target, weapon, custom_message_chance)
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
    return if we_always_do_scrum_buts?
    
    shots = @weapon.downcase.include?('gatling') ? 5 : 1
    1.upto(shots) do
      @response.reply shooting_message + ': ' +  snarky_result   
      @response.reply BURN_UNITS if is_flame_weapon?
    end
  end
  
  def nuke
    @response.reply ["#{@user.name} tosses a nuke into the room", "http://www.dudeiwantthat.com/omg/fools/nerf-nuke-12043.jpg"]
  end
  
  def snarky_result
    targets = nil
    snarky_user_messages = I18n.translate("lita.handlers.nerf_war.specific_targets.#{@user.name}".downcase)

    targets = snarky_user_messages[@target.to_sym] if snarky_user_messages[@target.to_sym].length > 0 rescue nil
    targets ||= snarky_user_messages[:default] if snarky_user_messages[:default].length > 0 && use_custom_default? rescue nil
    targets ||= @generic_targets
    
    snarky_message = targets[rand(targets.length)]
  end
    
  def shooting_message
    "#{@user.name} shoots #{@weapon} at #{@target}"
  end
  
  # chance to use a per-user default message
  def use_custom_default?
    rand(100) < custom_message_chance
  end
    
  def we_never_forget_vlad?
    if @target.downcase == 'vlad'    
      @response.reply [shooting_message, "http://www.quickmeme.com/img/22/221f53ddeb8084c01d4d50c966df793d30b8392c68b7cb0a5ec50a635e01cff2.jpg"]
      return true
    end
    false
  end
  
  def we_always_do_scrum_buts?
    if SCRUM_BUTS.include? @weapon.downcase
      @response.reply [shooting_message, "http://cdn.meme.am/instances/56730653.jpg"]
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