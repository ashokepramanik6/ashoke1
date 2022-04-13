- dashboard: assignment
  title: Assignment
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  description: ''
  elements:
  - title: Annual Order Report
    name: Annual Order Report
    model: dcl_training
    explore: order_items
    type: looker_column
    fields: [orders.count, orders.created_year, calculation_1]
    fill_fields: [orders.created_year]
    sorts: [orders.created_year desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{measure: calculation_1, based_on: inventory_items.cost, type: average,
        label: Calculation 1, expression: !!null '', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    y_axes: []
    row: 9
    col: 0
    width: 8
    height: 6
  - title: Assignment
    name: Assignment
    model: dcl_training
    explore: order_items
    type: looker_pie
    fields: [users.gender, users.count]
    filters: {}
    sorts: [users.count desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{measure: calculation_1, based_on: inventory_items.cost, type: average,
        label: Calculation 1, expression: !!null '', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number}]
    value_labels: legend
    label_type: labPer
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Created Date: orders.created_date
    row: 0
    col: 0
    width: 16
    height: 9
  filters:
  - name: Created Date
    title: Created Date
    type: field_filter
    default_value: 2016/02/03 to 2016/04/05
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
    model: dcl_training
    explore: order_items
    listens_to_filters: []
    field: orders.created_date
