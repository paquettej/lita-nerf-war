module Lita
  module Handlers
    class NerfWar < Handler
      
      config :target_file, type: String, required: false
      config :custom_message_chance, type: Integer, required: false, default: 50 
      
      attr_accessor :target
      attr_accessor :weapon

      route %r{nerf\s(\w+)\s*(.*)}i, :nerf, help: { "nerf <user>..." => "shoots user with a virtual dart"}
      route %r{nuke\s(\w+)\s*(.*)}i, :nuke, help: { "nuke <user>..." => "for those really bad days"}

      def nerf(response)
        Lita.load_locales config.target_file unless config.target_file.nil?        
        set_params(response)
        ::NerfWar.new(response, self.target, self.weapon, config.custom_message_chance).nerf()
      end
      
      def nuke(response)
        set_params(response)        
        ::NerfWar.new(response, self.target, self.weapon, config.custom_message_chance).nuke
      end
      
      def set_params(response)
        self.target = response.matches[0][0]
        self.weapon = response.matches[0][1]
        self.weapon.slice!('with ') if self.weapon.start_with?('with ')
      end
    end

    Lita.register_handler(NerfWar)
  end
end
