- dashboard: sss
  title: sss
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  elements:
  - title: sss
    name: sss
    model: ecommerce_ashoke
    explore: order_items
    type: looker_grid
    fields: [order_items.id, order_items.count]
    sorts: [order_items.count desc]
    limit: 50
    query_timezone: UTC
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen: {}
    row: 0
    col: 0
    width: 12
    height: 9
