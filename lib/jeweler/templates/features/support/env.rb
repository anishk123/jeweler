$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../../lib')
require '<%= require_name %>'

require '<%= feature_support_require %>'

World do |world|
  <% if feature_support_extend %>
  world.extend(<%= feature_support_extend %>)
  <% end %>
  world
end
