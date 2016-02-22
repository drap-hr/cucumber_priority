def prepare_cucumber_example
  @runtime = Cucumber::Runtime.new
  language = load_ruby_language
  scenario = double('scenario', :language => 'en', :accept_hook? => true)
  language.send(:begin_scenario, scenario)
  @world = language.current_world
  @main = Object.new
  @main.extend(Cucumber::RbSupport::RbDsl)
  # @runtime.before(scenario)
end

def load_ruby_language
  language = support_code.ruby if support_code.respond_to?(:ruby)
  language ||= support_code.load_programming_language('rb')
  language
end

def invoke_cucumber_step(step)
  support_code.step_match(step).invoke(nil) # nil means no multiline args
end

def support_code
  @runtime.instance_variable_get(:@support_code)
end

def first_step_match(*args)
  support_code.send(:step_matches, *args).first
end
