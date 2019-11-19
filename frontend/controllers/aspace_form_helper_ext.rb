module AspaceFormHelper

  class FormContext

    def label_and_fourpartid
      field_html = accession_id_0_field
      field_html << accession_id_1_field
      field_html << textfield("id_2", obj["id_2"], {:class => "id_2 form-control",
                                                    :size => 10,
                                                    :disabled => @active_template != 'accession' && obj["id_1"].blank? && obj["id_2"].blank?,
                                                    :'aria-label' => "id_2"})
      field_html << textfield("id_3", obj["id_3"], {:class => "id_3 form-control",
                                                    :size => 10,
                                                    :disabled => @active_template != 'accession' && obj["id_2"].blank? && obj["id_3"].blank?,
                                                    :'aria-label' => "id_3"})

      @forms.content_tag(:div, (I18n.t(i18n_for("id_0")) + field_html).html_safe, :class=> "identifier-fields")
      label_with_field("id_0", field_html, :control_class => "identifier-fields")
    end

    private

    def original_id_0_field
      textfield("id_0", obj["id_0"], :class => "id_0 form-control", :size => 10)
    end

    def original_id_1_field
      textfield("id_1", obj["id_1"], :class => "id_1 form-control", :size => 10, :disabled => obj["id_0"].blank? && obj["id_1"].blank?, :'aria-label' => "id_1")
    end

    def accession_id_0_field
      if @active_template == 'accession'
        select("id_0", possible_options_for("id_0", true, :class => "id_0 form-control", :size => 10))
      else
        original_id_0_field
      end
    end

    def accession_id_1_field
      if @active_template == 'accession'
        if @parent.action_name == 'defaults'
          "<em>#{I18n.t("accession.id_1_auto_generated")}</em>".html_safe
        else
          date = Time.now.getlocal('-05:00').strftime('%Y%m%d')
          placeholder = obj["id_1"] || "#{date}.#"

          # Validation checks require id_1 to exist if id_2 or id_3 exist
          # Add hidden input with id_1 value that will be replaced in create_from_json
          ("<em class='id_1_placeholder'>#{placeholder}</em>" + hidden_input("id_1", placeholder)).html_safe
        end
      else
        original_id_1_field
      end
    end

  end

end
