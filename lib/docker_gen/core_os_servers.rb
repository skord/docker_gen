require 'digital_ocean'
module DockerGen
  module DigitalOcean
    class Client
      attr_accessor :conn
      def initialize
        @conn = ::DigitalOcean::API.new(client_id: ENV['DO_CLIENT_KEY'],
                                        api_key: ENV['DO_API_KEY'])
      end
    end
    class SshKeys
      def self.keylist
        Client.new.conn.ssh_keys.list
      end
      def self.keylist_id_array
        keylist.ssh_keys.collect {|x| x.id }
      end
      def self.public_keys
        keylist_id_array.map {|k| 
          Client.new.conn.ssh_keys.show(k).ssh_key['ssh_pub_key']
        }
      end
    end
    class CoreOsImages
      def self.list
        Client.new.conn.images.list.images.select {|img| img.slug == "coreos-beta" }
      end
      def self.in_region_id(region_id)
        list.select {|img| img.regions.any? {|y| y == region_id }}
      end
    end
    class Regions
      def self.list
        Client.new.conn.regions.list.regions
      end
      def self.pretty_list
        list.collect {|reg| "id:#{reg['id']}(#{reg['slug']})"}.join(", ")
      end
    end
  end
end
