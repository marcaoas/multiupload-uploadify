module MultiuploadUploadify

  module HelperMethods
    
    def multiupload_field(*args)
      args = args.first
      script = <<-eos
          $(document).ready(function(){
            var data_session = new Object();
            data_session['authenticity_token'] = '#{args[:csrf_token]||=''}';
            data_session['#{args[:session_key]||=''}'] = '#{args[:session_key_value]||=''}';

            $('##{args[:id]||='uploadify_files'}').uploadify({
              'swf' : '#{asset_path('dependencies/uploadify.swf')}',
              'uploader' : '#{args[:url]||='#'}',
              'formData' : data_session,
              'onUploadSuccess' : #{args[:upload_function] ||= 'function(file, data, response){}'},
              'buttonText': '#{args[:label]||='Upload Files'}',
              'removeCompleted': #{args[:removeCompleted]||=false}
            });
          });
          eos
      content_for :scripts do 
        javascript_tag do 
          raw script
        end
      end
      file_field_tag args[:name]||='uploadify_files', :id => args[:id]||='uploadify_files', :multiple => true
    end
  end
end

ActionView::Base.send :include, MultiuploadUploadify::HelperMethods