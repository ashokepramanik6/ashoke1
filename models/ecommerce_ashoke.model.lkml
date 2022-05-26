# Define the database connection to be used for this model.
connection: "thelook"

# include all the views
include: "/views/**/*.view"
include: "/**/*.dashboard.lookml"

# use the Quick Help panel on the right to see documentation.

datagroup: ecommerce_ashoke_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  sql_trigger: select current_date ;;
  max_cache_age: "1 hour"
  }

 datagroup: users_datagroup {
   sql_trigger: select max(created_at) from public.orders ;;
  max_cache_age: "2 hours"
 }


persist_with: ecommerce_ashoke_default_datagroup

# access_grant: can_see_pii {
#   user_attribute: department
#   allowed_values: ["HR","Finance"]
# }

explore: inventory_items {
  join: products {
    type: left_outer
    sql_on: ${inventory_items.id} = ${products.id} ;;#product_id
    relationship: many_to_one
  }
}

explore: order_items {
  # sql_always_having: ${total_sale_price}>900 ;;
  # sql_always_having: ${returned_raw} is null ;;
  # always_filter: {
  #   filters: [orders.status: "-complete"]
  # }
  # always_filter: {
  #   filters: [inventory_items.created_date: "before today", inventory_items.created_date: "today"]
  # }
  # conditionally_filter: {
  #   filters: [inventory_items.created_date: "2 years"]
  #   unless: [inventory_items.id]
  # }
  # sql_always_where: ${orders.status}<>'pending' ;;
  # label: "Items_Orders"
  join: orders {
    type: left_outer
    sql_on: ${order_items.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: inventory_items {
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }

  join: users {

    # view_label: "Customer instead of users"
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_many #many_to_one #order_items>many, users>1
  }

  join: products {
    # view_label: "Product+Product1"
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
  join: product1 {
    # view_label: "Product+Product1"
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
}

explore: orders {

   fields: [ALL_FIELDS*]

  persist_with: users_datagroup

  access_filter: {
    user_attribute: country
    field: users.country
  }

  join: users {

    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_many #many_to_one
  }
  join: fact_sql_dt {
     type: left_outer
    sql_on: ${orders.user_id} = ${fact_sql_dt.order_items_id} ;;
    relationship: many_to_one
  }
  join: fact_ndt {
    type: left_outer
    sql_on: ${orders.user_id} = ${fact_ndt.customer_id} ;;
    relationship: one_to_one
  }
}
explore: product_facts {
  required_access_grants: [simple1]   #---using access grant
  join: products {
    type: left_outer
    sql_on: ${product_facts.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
}
# explore: users{   #------we can use either---Access_filter OR Access_grant-------------

#   access_filter: {
#     field: users.state
#     user_attribute: ashoke_demo
#   }
# }
access_grant: simple1 {
  user_attribute: ashoke_demo2
  allowed_values: [ "ashoke", "soni" ]
}

#####
# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.
