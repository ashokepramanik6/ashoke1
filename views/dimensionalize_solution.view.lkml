# If necessary, uncomment the line below to include explore_source.
# include: "ecommerce_ashoke.model.lkml"

view: dimensionalize_solution {
  derived_table: {
    explore_source: orders {
      column: customer_id { field: orders.id }
      column: city { field: users.city }
      column: count { field: orders.count }
    }
  }
  dimension: city {
    description: ""
  }
  dimension: count {
    description: ""
    type: number
  }
  measure: average_count_per_city {
    type: average
    sql: ${count} ;;
  }
  dimension: customer_id {
    type: number
    primary_key: yes
  }
}
