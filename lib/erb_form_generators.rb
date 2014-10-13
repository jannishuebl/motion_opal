require 'motion_opal/version'
require 'thor'

module RubymotionGenerators
  class Core < Thor
    include Thor::Actions

    desc "erb", "Generate a new file of the specified type"

    def erb(args)
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
