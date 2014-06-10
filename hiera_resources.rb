module Puppet::Parser::Functions
  newfunction(:hiera_resources, :type => :statement) do |args|
    raise Puppet::Error, "hiera_resources requires 1 argument; got #{args.length}" if args.length != 1
    resources = function_hiera_array([args[0], {}])

    # Delete duplicated resources (with the same name)
    #resources.uniq! { |r| r["name"]} # Only available in ruby >= 1.9.3

#    resources.each do |res|
#      title = res.delete("name")
#      type_name = res.delete("puppet_type")
#
#      params = { title => res }
#      debug "hiera_resources: title: #{title}, type_name: #{type_name}. params: #{params}"
#      function_create_resources([type_name, params])
#    end


    # For ruby 1.8.7
    resources_defined = []
    resources.each do |res|
      title = res.delete("name")
      type_name = res.delete("puppet_type")

      if !resources_defined.include?(title) 
        resources_defined << title
        params = { title => res }
        debug "hiera_resources: title: #{title}, type_name: #{type_name}. params: #{params}"
        function_create_resources([type_name, params])
      end
    end
  end
end

