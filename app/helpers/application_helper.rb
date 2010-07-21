# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def company_name(long=false)
    "<span class=\"company-name\">Racetopia.com"+(long ? ", LLC" : "")+"</span>"
  end # def company_name
  
  def page_title(controller)
    company_name(false)+" :: "+controller.controller_name.capitalize+" :: "+controller.action_name.capitalize
  end # def page_title
  
  # Loads application css
  # Loads controller css
  # Loads controller.action css
  def load_css(controller)
    css = [ stylesheet_link_tag("application", :media => "all") ]

    ctrl_name = controller.controller_name.gsub(/_/, "-")
    ctrl_file = "#{RAILS_ROOT}/public/stylesheets/#{ctrl_name}.css"

    if File.exist?(ctrl_file)
      css << stylesheet_link_tag(ctrl_name, :media => "all")
    end

    action_name = ctrl_name + "." + controller.action_name.gsub(/_/, "-")
    action_file = "#{RAILS_ROOT}/public/stylesheets/#{action_name}.css"

    if File.exist?(action_file)
      css << stylesheet_link_tag(action_name, :media => "all")
    end

    css.join("\n\t\t")
  end # def load_css
  
  # Loads application css
  # Loads controller css
  # Loads controller.action css
  def load_scripts(controller)
    js = [ javascript_include_tag("jquery"), javascript_include_tag("application")  ]

    ctrl_name = controller.controller_name.gsub(/_/, "-")
    ctrl_file = "#{RAILS_ROOT}/public/javascripts/#{ctrl_name}.js"

    if File.exist?(ctrl_file)
      js << javascript_include_tag(ctrl_name)
    end

    action_name = ctrl_name + "." + controller.action_name.gsub(/_/, "-")
    action_file = "#{RAILS_ROOT}/public/javascripts/#{action_name}.js"

    if File.exist?(action_file)
      js << javascript_include_tag(action_name)
    end

    js.join("\n\t\t")
  end # def load_scripts
  
  # We only want to include the google analytics snippet if we're on production
  def show_analytics?
    Rails.env.production?
  end # def show_analytics?

end
