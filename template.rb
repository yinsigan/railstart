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

