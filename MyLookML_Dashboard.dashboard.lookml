- dashboard: producttrend
  title: ProductTrend
  layout: newspaper
  elements:
  - title: Expensive Product
    name: Expensive Product
    model: shree_thelook
    explore: order_items
    type: looker_column
    fields: [products.category, products.Expense_Category, products.count]
    pivots: [products.Expense_Category]
    fill_fields: [products.Expense_Category]
    filters: {}
    sorts: [products.count desc 0]
    limit: 500
    listen:
      Product Category: products.category
    row: 2
    col: 0
    width: 8
    height: 5
  - title: Product Return Trend
    name: Product Return Trend
    model: shree_thelook
    explore: order_items
    type: looker_column
    fields: [order_items.returned_month, order_items.count, products.category]
    pivots: [order_items.returned_month]
    fill_fields: [order_items.returned_month]
    filters:
      order_items.returned_month: 3 months
    sorts: [order_items.returned_month desc, order_items.count desc 0]
    limit: 500
    listen:
      Product Category: products.category
    row: 2
    col: 8
    width: 9
    height: 5
  - name: Product Trend
    type: text
    title_text: Product Trend
    body_text: ''
    row: 0
    col: 0
    width: 24
    height: 2
  - title: Product In Inventory
    name: Product In Inventory
    model: shree_thelook
    explore: order_items
    type: looker_column
    fields: [inventory_items.count, inventory_items.product_category]
    sorts: [inventory_items.count desc]
    limit: 500
    listen: {}
    row: 7
    col: 0
    width: 17
    height: 5
  filters:
  - name: Product Category
    title: Product Category
    type: field_filter
    default_value: "%Jeans%"
    allow_multiple_values: true
    required: false
    model: shree_thelook
    explore: order_items
    listens_to_filters: []
    field: products.category
