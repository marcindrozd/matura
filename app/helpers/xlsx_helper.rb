module XlsxHelper

  def base_sz; 11; end
  def big_sz; 16; end
  def text_width; 40; end

  attr_reader :sheet
  def bind_xls_helpers(sheet)
    @sheet = sheet
  end

  def xls_height_from_text(*texts)
    if texts.any? { |text| text.present? }
      texts.map do |text|
        if text =~ /\n/
          (text.count("\n") + 1)
        elsif text.nil?
          0
        else
          (text.length / 60.0).ceil.to_i
        end
      end.max * base_sz * 1.5
    end
  end

  def xls_default_style
    sheet.styles.add_style(
      sz: base_sz,
      border: { style: :thin, color: '000000' },
      alignment: center_alignment
    )
  end

  def xls_default_wrap_style
    sheet.styles.add_style(
      sz: base_sz,
      border: { style: :thin, color: '000000' },
      alignment: { horizontal: :center, vertical: :center, wrap_text: true }
    )
  end

  def xls_default_right_align_style
    sheet.styles.add_style(
      sz: base_sz,
      border: { style: :thin, color: '000000' },
      alignment: right_alignment
    )
  end

  def xls_default_number_style
    sheet.styles.add_style(
      sz: base_sz,
      border: { style: :thin, color: '000000' },
      alignment: right_alignment,
      format_code: '0'
    )
  end

  def xls_products_default_style
    sheet.styles.add_style(
      sz: base_sz,
      border: { style: :thin, color: '000000', edges: [:left, :right] },
    )
  end

  def xls_products_bottom_row
    sheet.styles.add_style(
      sz: base_sz,
      border: { style: :thin, color: '000000', edges: [:left, :bottom, :right] },
    )
  end


  def xls_header_style
    sheet.styles.add_style(
      sz: big_sz,
      b: true,
      bg_color: 'DDDDDD',
      border: { style: :thin, color: '000000' },
      alignment: center_alignment
    )
  end

  def xls_header_right_align_style
    sheet.styles.add_style(
      sz: big_sz,
      b: true,
      bg_color: 'DDDDDD',
      border: { style: :thin, color: '000000' },
      alignment: right_alignment
    )
  end

  def xls_table_header_style
    sheet.styles.add_style(
      b: true,
      sz: base_sz,
      bg_color: 'EEEEEE',
      border: { style: :thin, color: '000000' },
      alignment: center_alignment.merge(wrap_text: true)
    )
  end

  def xls_products_headers_default_style
    sheet.styles.add_style(
      sz: base_sz,
      bg_color: 'DDDDDD',
      border: { style: :thin, color: '000000' },
      alignment: { horizontal: :center, vertical: :center, wrap_text: true }
    )
  end

  def xls_products_main_headers_style
    sheet.styles.add_style(
      sz: base_sz,
      bg_color: 'FFC000',
      border: { style: :thin, color: '000000' },
      alignment: center_alignment
    )
  end

  def xls_progress_style
    sheet.styles.add_style(
      num_fmt: 9,
      border: { style: :thin, color: '000000' },
      sz: base_sz,
      alignment: center_alignment
    )
  end

  def xls_text_style
    sheet.styles.add_style(
      sz: base_sz,
      border: { style: :thin, color: '000000' },
      alignment: {
        wrap_text: true,
        horizontal: :left,
        vertical: :center
      }
    )
  end

  def xls_date_style
    sheet.styles.add_style(
      sz: base_sz,
      border: { style: :thin, color: '000000' },
      alignment: center_alignment,
      format_code: 'yyyy-mm-dd'
    )
  end

  def xls_overall_default_style
    sheet.styles.add_style(
      sz: base_sz,
      b: true,
      bg_color: 'DDDDDD',
      border: { style: :thin, color: '000000' },
      alignment: center_alignment
    )
  end

  def xls_overall_default_right_align_style
    sheet.styles.add_style(
      sz: base_sz,
      b: true,
      bg_color: 'DDDDDD',
      border: { style: :thin, color: '000000' },
      alignment: right_alignment
    )
  end

  def xls_percent_style
    sheet.styles.add_style(
      sz: base_sz,
      border: { style: :thin, color: '000000'},
      alignment: right_alignment,
      format_code: '0.00%'
    )
  end

  def xls_overall_percent_style
    sheet.styles.add_style(
      sz: base_sz,
      b: true,
      bg_color: 'DDDDDD',
      border: { style: :thin, color: '000000'},
      alignment: right_alignment,
      format_code: '0.00%'
    )
  end

  def xls_float_1_style
    sheet.styles.add_style(
      sz: base_sz,
      border: { style: :thin, color: '000000'},
      alignment: right_alignment,
      format_code: '0.0'
    )
  end

  def xls_overall_float_1_style
    sheet.styles.add_style(
      sz: base_sz,
      b: true,
      bg_color: 'DDDDDD',
      border: { style: :thin, color: '000000'},
      alignment: right_alignment,
      format_code: '0.0'
    )
  end

  def xls_float_3_style
    sheet.styles.add_style(
      sz: base_sz,
      border: { style: :thin, color: '000000'},
      alignment: right_alignment,
      format_code: '0.000'
    )
  end

  def xls_float_5_style
    sheet.styles.add_style(
      sz: base_sz,
      border: { style: :thin, color: '000000'},
      alignment: right_alignment,
      format_code: '0.00000'
    )
  end

  def xls_overall_float_3_style
    sheet.styles.add_style(
      sz: base_sz,
      b: true,
      bg_color: 'DDDDDD',
      border: { style: :thin, color: '000000'},
      alignment: right_alignment,
      format_code: '0.000'
    )
  end

  def xls_currency_style
    sheet.styles.add_style(
      sz: base_sz,
      border: { style: :thin, color: '000000'},
      alignment: right_alignment,
      format_code: '€ 0.00'
    )
  end

  def xls_dollars_style
    sheet.styles.add_style(
      sz: base_sz,
      border: { style: :thin, color: '000000'},
      alignment: right_alignment,
      format_code: '$ 0.00'
    )
  end

  def xls_major_dollars_style
    sheet.styles.add_style(
      sz: base_sz,
      border: { style: :thin, color: '000000'},
      alignment: right_alignment,
      format_code: '$ 0,000'
    )
  end

  def xls_major_currency_style
    sheet.styles.add_style(
      sz: base_sz,
      border: { style: :thin, color: '000000'},
      alignment: right_alignment,
      format_code: '€ 0,000'
    )
  end

  def xls_overall_currency_style
    sheet.styles.add_style(
      sz: base_sz,
      b: true,
      bg_color: 'DDDDDD',
      border: { style: :thin, color: '000000'},
      alignment: right_alignment,
      format_code: '€ 0.00'
    )
  end

  def xls_overall_dollars_style
    sheet.styles.add_style(
      sz: base_sz,
      b: true,
      bg_color: 'DDDDDD',
      border: { style: :thin, color: '000000'},
      alignment: right_alignment,
      format_code: '$ 0.00'
    )
  end

  def xls_overall_major_dollars_style
    sheet.styles.add_style(
      sz: base_sz,
      b: true,
      bg_color: 'DDDDDD',
      border: { style: :thin, color: '000000'},
      alignment: right_alignment,
      format_code: '$ 0,000'
    )
  end

  def xls_overall_major_currency_style
    sheet.styles.add_style(
      sz: base_sz,
      b: true,
      bg_color: 'DDDDDD',
      border: { style: :thin, color: '000000'},
      alignment: right_alignment,
      format_code: '€ 0,000'
    )
  end

  def xls_red_row_style
    sheet.styles.add_style(
      sz: base_sz,
      border: { style: :thin, color: '000000' },
      alignment: center_alignment,
      bg_color: 'FF0000'
    )
  end

  def xls_yellow_row_style
    sheet.styles.add_style(
      sz: base_sz,
      border: { style: :thin, color: '000000' },
      alignment: center_alignment,
      bg_color: 'FFFF99'
    )
  end

  def xls_contributors_for(record)
    [
      record.contributor_groups.decorate.map(&:autocomplete_label),
      record.contributor_users.map(&:to_s)
    ].flatten.join("\n")
  end

  def conditional_style_for(record)
    case record.percentage
      when 1..100 then xls_yellow_row_style
      when 100..1000 then xls_red_row_style
      else xls_default_style
    end
  end

  private

  def center_alignment
    {
      vertical: :center,
      horizontal: :center
    }
  end

  def right_alignment
    {
      vertical: :center,
      horizontal: :right
    }
  end
end
