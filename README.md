multiupload-uploadify
=====================

Multiupload-uploadify is a gem for multiupload using the <a href='http://www.uploadify.com/'>uploadify</a> plugin

###Getting started

For use the gem add this in your Gemfile

``` ruby
gem "multiupload-uploadify", :git => 'https://github.com/marcaoas/multiupload-uploadify.git'
```
Run the bundle command to install it.

Now you need run the generate command

``` console
rails generate multiupload_uploadify
```

Add this in your application.js
``` javascript
//= require jquery.uploadify-3.1
//= provide dependencies
```

and this in your application.css
``` css
*= require uploadify
```

For use the muptiupload gem call the helper method in your view
``` erb
<%= multiupload_field :url => new_photo_path %>
```
and add this in your layout file
``` erb
<%= content_fot :scripts if content_for? :scripts %>
```
and in yout controller you receive the files through the parameter Filedata

``` ruby
Photo.create(:picture => params[:Filedata])
```

if you want know the id of the model you need do this

in your controller
``` ruby
photo = Photo.create(:picture => params[:Filedata])
render :text => photo.id
```

and pass a javascript function responsible for handling the return of the request
``` erb
<<<<<<< HEAD
<%= multiupload_field :url => new_photo_path, :upload_function => 'myFunction' %>
=======
<%= multiupload_field :url => new_photo_path, :options => { :onUploadSuccess =>  'myFunction' %>
>>>>>>> hotfix/correcoes_script_devise
<script type="text/javascript">
function myFunction(file, data, response){
	alert(data);
}
</script>
```

any other parameter of the plugin you can pass using
``` erb
<%= multiupload_field :url => new_photo_path, :options => { :buttonText =>  '"Upload Photos"' %>
```

### devise + multiupload-uploadfy

if you use the devise gem you need pass the parameters of your session for authentication
you can do it like this:
``` erb
<%= multiupload_field :url => new_photo_path, :parameters => {Rails.application.config.session_options[:key] => cookies[Rails.application.config.session_options[:key]] } %>
```
