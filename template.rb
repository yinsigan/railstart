remove_file 'public/index.html'
generate(:controller, "home index")
gsub_file 'config/routes.rb', /get \"home\/index\"/, 'root :to => "home#index"'
gem 'anjlab-bootstrap-rails', '>= 2.1', :require => 'bootstrap-rails'

insert_into_file 'app/assets/javascripts/application.js', "//=require twitter/bootstrap\n", :after => "jquery_ujs\n"
insert_into_file 'app/assets/stylesheets/application.css', " *= require app_bootstrap\n", :after => "require_self\n"
create_file 'app/assets/stylesheets/app_bootstrap.css.scss', <<-RUBY
// change colors
$linkColor: red;

// change grid
$gridColumnWidth: 70px;
$gridGutterWidth: 10px;

// import original bootstrap
@import "twitter/bootstrap";
@import "twitter/bootstrap-responsive";

body {
  padding-top: 60px;
}
RUBY

remove_file 'app/views/layouts/application.html.erb'
get "https://raw.github.com/yinsigan/railstart/master/layouts/application.html.erb", "app/views/layouts/application.html.erb"
get "https://raw.github.com/yinsigan/railstart/master/layouts/_messages.html.erb", "app/views/layouts/_messages.html.erb"
get "https://raw.github.com/yinsigan/railstart/master/layouts/_navigation.html.erb", "app/views/layouts/_navigation.html.erb"

gsub_file 'Gemfile', /#.*\n/, "\n"
gsub_file 'Gemfile', /\n^\s*\n/, "\n"

# remove commented lines and multiple blank lines from config/routes.rb
gsub_file 'config/routes.rb', /  #.*\n/, "\n"
gsub_file 'config/routes.rb', /\n^\s*\n/, "\n"
