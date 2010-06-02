require 'rubygems'
require 'active_support'
require 'yaml'

module Deploy

  class Error

  end

  class << Error

    def not_implemented(method)
      new("The method:[#{method}] hasn't been implemented yet.")
    end

  end

  class Version

    attr_accessor :current_version, :deployed_by, :time_zone

    def initialize
      @deployed_time = Time.now
    end

    def load_from_url
      raise Error.not_implemented
    end

    def load_from_file
      raise Error.not_implemented
    end

    def store_to_file(filename)
      File.open(filename, 'w+') do |file|
        file.puts export
      end
    end

    def time_zone=(value = 'EST')
      Time.zone = value
      @deployed_time = Time.zone.now
    end

    def deployed_time
      @deployed_time
    end

    def to_h
      {
        :current_version => @current_version,
        :deployed_by => @deployed_by,
        :deployed_time => deployed_time
      }
    end

    def export
      YAML::dump(to_h)
    end

  end

end
