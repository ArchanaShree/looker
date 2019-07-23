connection: "thelook"

# include all the views
include: "*.view"
include: "*.dashboard.lookml"

datagroup: shree_thelook_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "4 hour"
}

persist_with: shree_thelook_default_datagroup



explore: etl_jobs {}

explore: events {
  join: users {
    type: inner
    sql_on: ${events.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}



explore: order_items {
  join: orders {
    view_label:"OrderRelation"
    fields: [id, user_id, created_time, status, orders.count]
    sql_on: ${orders.id} = ${order_items.order_id} ;;
    type: left_outer
    relationship: many_to_one
  }

  join: users {
    sql_on: ${users.id} = ${order_items.user_id} ;;
    type: left_outer
    relationship: many_to_one
  }
  join: inventory_items {
    sql_on: ${inventory_items.id} = ${order_items.inventory_item_id} ;;
    type: left_outer
    relationship: one_to_one
  }

  join: products {
    sql_on: ${products.id} = ${inventory_items.product_id} ;;
    type: left_outer
    relationship: many_to_one
  }

  join:  distribution_centers {
    sql_on: ${distribution_centers.id} = ${inventory_items.product_distribution_center_id} ;;
    type: left_outer
    relationship: many_to_one
  }
}




explore: distribution_centers {
  sql_always_where: ${name} like '%CA%' ;;
}




explore: californiaUsers {
  from: users
  label: "California Users"
  always_filter: {
    filters: {
      field: state
      value: "CA"
    }
  }
}
