require 'thor'

module Hue
  class Cli < Thor
    desc 'lights', 'Find all of the lights on your network'
    def lights
      client.lights.each do |light|
        puts light.id.to_s.ljust(6) + light.name
      end
    end

    desc 'all STATE', 'Send commands to all lights'
    def all(state)
      on = state == 'on'
      client.lights.each do |light|
        light.on = on
      end
    end

  private

    def client
      @client ||= Hue::Client.new
    end
  end
end