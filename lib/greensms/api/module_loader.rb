require "greensms/api/modules"
require "greensms/api/module"
require "greensms/utils/url"

module GreenSMS
  module API
    class ModuleLoader

      def initialize()
        @module_map = {}
      end

      def register_modules(shared_options, filters = {})

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

          module_versions.each do | version, version_functions |

            if !@module_map[module_name].has_key?(version) then
              @module_map[module_name][version] = {}
            end

            version_functions.each do |function_name, definition|
              if !@module_map[module_name][version].has_key?(function_name) then
                @module_map[module_name][version][function_name] = {}
              end

              module_schema = nil
              schema_exists = module_info.has_key? 'schema' && module_info['schema'].has_key?(version) && module_info['schema'][version].has_key?(function_name)
              if schema_exists == true then
                module_schema = module_info['schema'][version][function_name]
              end

              url_args = []
              if !module_info.has_key?('static') || module_info['static'] != true then
                url_args.append(module_name)
              end
              url_args.append(function_name)

              api_url = GreenSMS.build_url(shared_options['base_url'], url_args)
              @module_map[module_name][version][function_name] = module_api(
                        shared_options:shared_options, api_url:api_url, definition:definition, module_schema:module_schema)

              if version == current_version then
                @module_map[module_name][function_name] = @module_map[module_name][version][function_name]
              end


              if module_info.has_key?('static') && module_info['static'] == true then
                @module_map[function_name] = @module_map[module_name][version][function_name]
                @module_map.delete(module_name)
              end

            end
          end
        end
        return @module_map

      end

      private
      def module_api(kwargs)
        rest_client = kwargs[:shared_options]["rest_client"]
        module_schema = kwargs['module_schema']

        request_params = {
            'url' =>  kwargs[:api_url],
            'method' => kwargs[:definition]["method"],
        }

        mod = GreenSMS::API::Module.new(rest_client, module_schema, request_params)
        api_call = mod.method(:api_func)
        return api_call

      end
    end
  end
end