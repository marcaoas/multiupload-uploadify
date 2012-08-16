class MultiuploadUploadifyGenerator < Rails::Generators::Base
  source_root File.expand_path("../../../../", __FILE__)

  desc "Copy files uploadify and middleware."

  def copy_uploadify_files
    copy_file "vendor/assets/javascripts/dependencies/uploadify.swf", "vendor/assets/javascripts/dependencies/uploadify.swf"
    copy_file "vendor/assets/javascripts/jquery.uploadify-3.1.js", "vendor/assets/javascripts/jquery.uploadify-3.1.js"
    copy_file "vendor/assets/stylesheets/uploadify.css.erb", "vendor/assets/stylesheets/uploadify.css.erb"
    copy_file "vendor/assets/images/uploadify-cancel.png", "vendor/assets/images/uploadify-cancel.png"
  end

  def copy_middleware
    copy_file "app/middleware/flash_session_cookie_middleware.rb", "app/middleware/flash_session_cookie_middleware.rb"
  end

  def copy_middleware_initializer
    copy_file "config/initializers/middleware_loader.rb", "config/initializers/middleware_loader.rb"
  end
end
