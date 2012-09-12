class ServiceGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  def create_service_file
    template "service.rb", File.join('app/services', class_path, "#{file_name}.rb")
  end

  def create_spec_file
    template "service_spec.rb", File.join('spec/services', class_path, "#{file_name}_spec.rb")
  end

end
