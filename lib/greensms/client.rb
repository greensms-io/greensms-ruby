require "greensms/version"
require "greensms/utils/str"
require "greensms/utils/url"
require "greensms/utils/version"
require "greensms/http/rest"
require "greensms/api/module_loader"

module GreenSMS
  class Error < StandardError; end

  class MethodInvoker
    attr_reader :root_name
    attr_reader :method_name

    def setName(r, n)
      @root_name = r
      @method_name = n
    end

    def method_missing(method, *args, &block)
      ivar_name = "@#{method}".intern

      if instance_variable_defined? ivar_name
        instance_variable_get ivar_name
      else
        super method, *args, &block
      end
    end

    def create_method(name, block)
      # self.class.send(:define_method, name, &block)
      # define_method(name, &block)
    end

  end

  class GreenSMSClient

    attr_reader :call
    attr_reader :voice

    def initialize(user: nil, pass: nil, token: nil, version: nil, camel_case_response: false, use_token_for_requests: false)
      @user = ENV.fetch("GREENSMS_USER", user)
      @pass = ENV.fetch("GREENSMS_PASS", pass)
      @token = ENV.fetch("GREENSMS_TOKEN", token)

      @version = version
      @camel_case_response = camel_case_response
      @use_token_for_requests = use_token_for_requests

      if !GreenSMS.is_null_or_empty(@token)
        @user = ""
        @password = ""
      end

      if GreenSMS.is_null_or_empty(@token) and (GreenSMS.is_null_or_empty(@user) || GreenSMS.is_null_or_empty(@pass))
        raise StandardError.new "Either User/Pass or Auth Token is required!"
      end

      shared_options = {
        "use_token_for_requests" => @use_token_for_requests,
        "version" => GreenSMS.get_version(@version),
        "rest_client" => _get_http_client(use_camel_case: @camel_case_response),
        "base_url" => GreenSMS.base_url(),
      }

      _add_modules(shared_options)
    end

    private

    def _add_modules(shared_options)
      module_loader = GreenSMS::API::ModuleLoader.new
      modules = module_loader.register_modules(shared_options)

      build_module_invoker(self, modules, "root")

      puts "=======\n\n"
      # puts self.call.send
      puts "=======\n\n"
    end

    def build_module_invoker(obj, hash, obj_name)
      hash.each do | key_name, key_value |
        puts "Obj " + obj_name +   ":: Key " + key_name + " :: " + obj.class.name
        if key_value.is_a?(Hash)
          new_item = MethodInvoker.new
          new_item.setName(obj_name, key_name)
          puts "Setting Ins Name " + new_item.root_name + " " + new_item.method_name  + " " + obj.class.name
          build_module_invoker(new_item, key_value, key_name)

          obj.instance_variable_set("@#{key_name}", new_item)

          obj.instance_eval %{
            def #{key_name}
              puts "@#{key_name}"
              instance_variable_get("@#{key_name}")
            end
          }
        else
          func = key_value.clone
          obj.instance_variable_set("@#{key_name}", func.method(:api_func))

          obj.instance_eval %{
            def #{key_name}
              instance_variable_get("@#{key_name}").call
            end
          }
        end
      end
    end

    def _get_http_client(**kwargs)
      default_params = {}

      if GreenSMS.is_null_or_empty(@token) && !GreenSMS.is_null_or_empty(@user)
        default_params["user"] = @user
        default_params["pass"] = @pass
      end

      http_args = {
        'default_params': default_params,
        'default_data': {},
        'token': @token,
      }

      kwargs.each do |key, val|
        http_args[key] = val
      end

      rest_client = GreenSMS::Http::Client.new(http_args)
      return rest_client
    end
  end
end



# def build_module_invoker_from_flat_hash(flat_hash)
#   puts "Flat Map------"
#   flat_hash.each do |name, func|
#     module_tree = name.to_s.split(".")
#     module_tree_length = module_tree.length()
#     obj = self
#     puts "Next Level===========================================" + name.to_s + " " + obj.class.name
#     module_tree.each_with_index do | module_name, index |
#       if index == module_tree_length -1
#         puts "Method " + module_name
#         puts func.module_schema
#         obj.create_method(module_name, func.method(:api_func))
#       else
#         puts "Insts " + module_name
#         mod = MethodInvoker.new
#         obj.instance_variable_set("@#{module_name}", mod)
#         obj.class.module_eval("attr_reader :#{module_name}")
#         obj = mod
#       end
#     end
#     puts "\n"
#   end
#   puts "Flat End Map------"
# end

# def flatten_hash(hash)
#   hash.each_with_object({}) do |(k, v), h|
#     if v.is_a? Hash
#       flatten_hash(v).map do |h_k, h_v|
#         h["#{k}.#{h_k}".to_sym] = h_v
#       end
#     else
#       h[k] = v
#     end
#   end
# end


# def build_module_invoker(obj, hash)
#   hash.each_with_object({}) do |name, value|
#     puts obj.class.name
#     puts "Var Name " + name.to_s +  " " + value.class.name

#     puts "\n==="
#     if value.is_a?(Hash)
#       item = MethodInvoker.new
#       build_module_invoker(item, value)
#       obj.instance_variable_set("@#{name}", item)
#       obj.class.module_eval("attr_reader :#{name}")
#     else
#       func = value
#       puts func.module_schema
#       obj.create_method(name, func.method(:api_func))
#       # obj.create_method(name, value)
#     end
#   end
# end
