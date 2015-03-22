module Lita
  module Handlers
    class NerfWar < Handler
      
      def self.default_config(config)
        # config.command_only = true
      end
      
      attr_accessor :target
      attr_accessor :weapon

      route %r{nerf\s(\w+)\s*(.*)}i, :nerf, help: { "nerf <user>..." => "shoots user with a virtual dart"}
      route %r{nuke\s(\w+)\s*(.*)}i, :nuke, help: { "nuke <user>..." => "for those really bad days"}
            
      def nerf(response)
        set_params(response)
        ::NerfWar.new(response, self.target, self.weapon).nerf()
      end
      
      def nuke(response)
        set_params(response)        
        ::NerfWar.new(response, self.target, self.weapon).nuke
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
