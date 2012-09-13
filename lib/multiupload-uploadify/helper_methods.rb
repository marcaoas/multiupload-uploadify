module MultiuploadUploadify

  module HelperMethods
    
    def multiupload_field(*args)
      args = args.first
      options = args[:options].to_a
      parameters = args[:parameters].to_a
      script = <<-eos
        $(document).ready(function(){
          var data = new Object();
          data[$("meta[name='csrf-param']").attr('content')] = $("meta[name='csrf-token']").attr('content');
        eos
      parameters.each do |parameter|
        script += "data['#{parameter[0].to_s}'] = #{parameter[1].to_s};"
      end
      script += <<-eos
        $('##{args[:id]||='uploadify_files'}').uploadify({
      eos
      options.each do |option|
        script += "'#{option[0].to_s}' : #{option[1].to_s},"
      end
      script += <<-eos
            'uploader' : '#{args[:url]||='#'}',
            'formData' : data,
            'swf' : '#{asset_path('dependencies/uploadify.swf')}'
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