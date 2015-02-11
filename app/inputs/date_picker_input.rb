class DatePickerInput < SimpleForm::Inputs::StringInput
  def input
    value = object.send(attribute_name) if object.respond_to? attribute_name
    display_pattern = I18n.t('datepicker.dformat', :default => '%Y/%m/%d')
    input_html_options[:value] ||= I18n.localize(value, :format => display_pattern) if value.present?

    input_html_options[:type] = 'text'
    picker_pettern = I18n.t('datepicker.pformat', :default => 'YYYY/MM/DD')
    input_html_options[:data] ||= {}
    input_html_options[:data].merge!({ language: I18n.locale.to_s,
                                       date_weekstart: I18n.t('datepicker.weekstart', :default => 0)})
    input_html_classes << "form-control"

    template.content_tag :div, class: 'input-group datepicker', data: { 'date-format' => picker_pettern }, id: 'datepicker1' do
      input = super # leave StringInput do the real rendering
      input += template.content_tag :span, class: 'input-group-addon' do
        template.content_tag :i, '', class: 'fa fa-calendar fa-fixed-width', data: { 'time-icon' => 'fa fa-clock-o icon-time', 'date-icon' => 'fa fa-calendar icon-calendar' }
      end
      # input
    end

  end
end
