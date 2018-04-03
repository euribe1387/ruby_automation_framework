require "capybara-screenshot"
#
# See https://github.com/cucumber/cucumber/wiki/Hooks for more info about hooks
#

After('@screenshot') do |scenario|

  Capybara::Screenshot.prune_strategy = :keep_all

  Capybara::save_path = ENV["SCREENSHOTS"] # > definir variable con el path de donde se van a guardar
  if File.directory?(ENV["SCREENSHOTS"])
    FileUtils.mkdir_p(ENV["SCREENSHOTS"])
  end

  screenshot_name = scenario.respond_to?(:scenario_outline) ? scenario.scenario_outline.location.file : scenario.location.file
  if scenario.failed?
    Capybara.using_session(Capybara::Screenshot.final_session_name) do
      filename_prefix = Capybara::Screenshot.filename_prefix_for(:cucumber, scenario)+"_"+screenshot_name.gsub(' ','_').gsub('.','_')
      saver = Capybara::Screenshot::Saver.new(Capybara, Capybara.page, false, filename_prefix)
      saver.save
      saver.output_screenshot_path
    end
  end

end

Before ('@full_screen') do
  begin
    page.driver.browser.manage.window.maximize
  rescue Exception => e
    printf "\n\t|--Unable to maximaze the browser"
    printf "\n\t\t-->Error: #{e}"
  end
end