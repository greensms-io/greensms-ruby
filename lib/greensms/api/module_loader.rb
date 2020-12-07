require "greensms/api/modules"

module GreenSMS
  module API
    class ModuleLoader

      def initialize()
        @module_map = {}
      end

      def register_modules(shared_options, filters = {})

        puts @module_map

        if filters.nil? then
          filters = {}
        end

        current_version = shared_options['version']
        modules = GreenSMS::MODULES

        modules.each do |module_name, module_info|

          if !@module_map.has_key?(module_name.to_sym) then
            @module_map[module_name] = {}
          end

          module_versions = module_info['versions']
          module_schema = nil

          is_static_module =  filters.has_key?('load_static') && module_info.has_key?('static') && filters['load_static'] == true && module_info['static'] = true

          next if is_static_module

          puts module_versions

          module_versions.each do | version, version_functions |
            if !@module_map[module_name].has_key?(version) then
              @module_map[module_name][version] = {}
            end

          end

        end
        return @module_map

      end
    end
  end
end