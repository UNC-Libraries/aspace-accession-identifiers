module AspaceFormHelper

  class FormContext

    def label_and_fourpartid
      field_html = @active_template == 'accession' ? accession_id_0_field : original_id_0_field
      field_html << textfield("id_1", obj["id_1"], {:class => "id_1 form-control",
                                                    :size => 10,
                                                    :disabled => obj["id_0"].blank? && obj["id_1"].blank? && @active_template != 'accession',
                                                    :'aria-label' => "id_1"})
      field_html << textfield("id_2", obj["id_2"], {:class => "id_2 form-control",
                                                    :size => 10,
                                                    :disabled => obj["id_1"].blank? && obj["id_2"].blank? && @active_template != 'accession',
                                                    :'aria-label' => "id_2"})
      field_html << textfield("id_3", obj["id_3"], {:class => "id_3 form-control",
                                                    :size => 10,
                                                    :disabled => obj["id_2"].blank? && obj["id_3"].blank?,
                                                    :'aria-label' => "id_3"})

      @forms.content_tag(:div, (I18n.t(i18n_for("id_0")) + field_html).html_safe, :class=> "identifier-fields")
      label_with_field("id_0", field_html, :control_class => "identifier-fields")
    end

    private

    def original_id_0_field
      textfield("id_0", obj["id_0"], :class => "id_0 form-control", :size => 10)
    end

    def accession_id_0_field
      select("id_0", possible_options_for("id_0", true, :class => "id_0 form-control", :size => 10))
    end

  end

end
