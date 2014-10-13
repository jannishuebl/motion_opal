require 'motion_opal/version'
require 'thor'

class String
  def underscore
    self.gsub(/::/, '/').
        gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
        gsub(/([a-z\d])([A-Z])/,'\1_\2').
        tr("-", "_").
        downcase
  end
end
module RubymotionGenerators
  class Core < Thor
    include Thor::Actions

    desc "erb", "Generate a new file of the specified type"

    def erb(args)
      template_name, name = args

      case template_name
      when 'form'
         generate_form_view_controller name
      else
        puts "Invalid template name '#{template_name}'"
        exit 1
      end
    end

    private


    def generate_form_view_controller(name)
      output_path_controller = "app/controllers/#{name.underscore}/#{name.underscore}_table_view_controller.rb"
      output_path_form = "app/controllers/#{name.underscore}/#{name.underscore}_formula.rb"
      template 'templates/form_view_controller.rb', output_path_controller
      template 'templates/formula.rb', output_path_form
      class_name_controller = name + 'TableViewController'
      class_name_formula = name + 'Formula'
      insert_into_file output_path_controller, class_name_controller, :after => 'class '
      insert_into_file output_path_controller, class_name_formula, :after => 'initWithForm '
      insert_into_file output_path_form, class_name_formula, :after => 'class '
    end

    def self.source_root
      File.dirname(__FILE__)
    end
  end
end
