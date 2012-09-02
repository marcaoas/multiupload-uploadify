multiupload-uploadify
=====================

Multiupload-uploadify is a gem for multiupload using the <a href='http://www.uploadify.com/'>uploadify</a> plugin

###Getting started

To gem add this to your Gemfile

``` ruby
gem "multiupload-uploadify", :github => https://github.com/marcaoas/multiupload-uploadify.git
```
Run the bundle command to install it.

Now you need run the generate command

``` console
rails generate multiupload_uploadify
```

Add this to your application.js
``` ruby
//= require jquery.uploadify-3.1
//= provide dependencies
```

and this to your application.css
``` ruby
*= require uploadify
```

To use the muptiupload gem  you can use the helper method in your view
``` ruby
<%= multiupload_field :url => teste_path %>
```
and add this in your layout file
``` ruby
<%= content_for :scripts if content_for? :scripts %>
```
and in your controller you can get the files through the Filedata param

``` ruby
Photo.create(:picture => params[:Filedata])
```

if you want to know the id of the model you need do this

in your controller
``` ruby
photo = Photo.create(:picture => params[:Filedata])
render :text => photo.id
```

and pass a javascript function responsible for handling the return of the request
``` ruby
<%= multiupload_field :url => teste_path, :upload_function => 'myFunction' %>
<script type="text/javascript">
function myFunction(file, data, response){
	alert(data);
}
</script>
```
