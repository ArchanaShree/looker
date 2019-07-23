- dashboard: ordertrend
  title: OrderTrend
  layout: newspaper
  elements:
  - title: Order Creation Trend
    name: Order Creation Trend
    model: shree_thelook
    explore: order_items
    type: looker_line
    fields: [order_items.created_date, order_items.count]
    fill_fields: [order_items.created_date]
    filters: {}
    sorts: [order_items.created_date desc]
    limit: 500
    listen:
      Month: order_items.created_date
    row: 0
    col: 0
    width: 8
    height: 6
  - title: Product Return Trend
    name: Product Return Trend
    model: shree_thelook
    explore: order_items
    type: looker_column
    fields: [order_items.count, products.category, order_items.returned_month]
    pivots: [products.category]
    fill_fields: [order_items.returned_month]
    filters:
      order_items.returned_month: 3 months
    sorts: [order_items.returned_month desc, products.category 0]
    limit: 500
    series_types: {}
    listen:
      Month: order_items.returned_date
    row: 0
    col: 8
    width: 8
    height: 6
  - title: Gender Shopping Trend
    name: Gender Shopping Trend
    model: shree_thelook
    explore: order_items
    type: looker_pie
    fields: [users.gender, order_items.count]
    filters:
      order_items.created_month: 3 months
    sorts: [order_items.count desc]
    limit: 500
    series_types: {}
    listen:
      Month: order_items.created_date
    row: 0
    col: 16
    width: 8
    height: 6
  - title: Gegraphical Order Trend
    name: Gegraphical Order Trend
    model: shree_thelook
    explore: order_items
    type: looker_map
    fields: [users.location, order_items.count]
    filters:
      users.country: USA
    sorts: [order_items.count desc]
    limit: 500
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: custom
    map_latitude: 33.94335994657882
    map_longitude: -101.11816406250001
    map_zoom: 4
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: true
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    series_types: {}
    listen:
      Month: order_items.created_date
    row: 6
    col: 0
    width: 24
    height: 7
  filters:
  - name: Month
    title: Month
    type: date_filter
    default_value: 3 months
    allow_multiple_values: true
    required: false
