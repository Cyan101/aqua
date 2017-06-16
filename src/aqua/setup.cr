macro gets_scalar(value)
  yaml.scalar "{{value}}"
  puts "Enter {{value}}:"
  yaml.scalar gets.not_nil!.chomp
end

unless File.exists?("config.yaml")
  puts "No config found, creating config.yaml"
  yaml = YAML.build do |yaml|
    yaml.mapping do
      gets_scalar token
      gets_scalar prefix
      gets_scalar owner_id
    end
  end

  File.write("config.yaml", yaml)
end
