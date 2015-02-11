class DatetimePickerInput < SimpleForm::Inputs::StringInput
  def input
    value = object.send(attribute_name) if object.respond_to? attribute_name
    display_pattern = I18n.t('datepicker.dformat', :default => '%d-%m-%Y') + ' ' + I18n.t('timepicker.dformat', :default => '%R')
    input_html_options[:value] ||= I18n.localize(value.to_date, :format => display_pattern) if value.present?

    input_html_options[:type] = 'text'
    picker_pettern = I18n.t('datepicker.pformat', :default => 'YYYY/MM/DD') + '   ' + I18n.t('timepicker.pformat', :default => 'hh:mm A')
    input_html_options[:data] ||= {}
    input_html_options[:data].merge!({ format: picker_pettern, language: I18n.locale.to_s,
                                       date_weekstart: I18n.t('datepicker.weekstart', :default => 0) })
    input_html_classes << "form-control"

    template.content_tag :div, class: 'input-group date', data: { 'date-format' => picker_pettern } do
      # input = template.content_tag :input, class: 'form-control'
      input = super # leave StringInput do the real rendering
      # end
      # template.content_tag :div, :class => "col-lg-1" do
      input += template.content_tag :span, class: 'input-group-addon' do
        template.content_tag :i, '', class: 'fa fa-calendar', data: { 'time-icon' => 'fa fa-clock-o icon-time', 'date-icon' => 'fa fa-calendar icon-calendar' }
      end
      # end
      # input
    end
  end
end
# <div class="form-group date_picker required booking_first_session_at">
#     <label class="date_picker required control-label" for="booking_first_session_at">
#       <abbr title="required">*</abbr> First session at
#     </label>
#     <div class="input-group date" id="datepicker1" data-date-format="YYYY/MM/DD">
#       <input class="string date_picker required form-control" id="booking_first_session_at" name="booking[first_session_at]" type="text">
#       <span class="input-group-addon">
#         <i class="fa fa-calendar" data-date-icon="fa fa-calendar icon-calendar"></i>
#       </span>
#     </div>
#   </div>
