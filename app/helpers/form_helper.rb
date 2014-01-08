module FormHelper

  def error_messages_for(object, options = {})
    object = find_real_object(object)

    if object && object.errors.any?

      alert_block(type: :danger, closable: false) do
        haml_tag 'h4.alert-heading' do
          haml_tag 'i.icon-exclamation-sign'
          haml_concat(options[:header_message] || translate(:header, :scope => [:errors, :template]))
        end
        haml_tag :ul do
          object.errors.full_messages.each do |msg|
            haml_tag :li, msg
          end
        end
      end
    end
  end

  module FormBuilderMethods

    # Calls `error_messages_for` in the context of a form object.
    #
    # options - Hash of options to pass to `error_messages_for`.
    #
    # Examples
    #
    #   = form_for @service_entry do |f|
    #     = f.error_messages
    def error_messages(options = {})
      @template.error_messages_for(@object_name, objectify_options(options))
    end
  end

  private
  def find_real_object(object)
    object = instance_variable_get("@#{object}") unless object.respond_to?(:to_model)
    object = convert_to_model(object)
  end

end

class ActionView::Helpers::FormBuilder
  include FormHelper::FormBuilderMethods
end
