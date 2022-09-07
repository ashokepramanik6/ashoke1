view: order_status_vijaya {
  sql_table_name: demo_db.order_status_vijaya ;;

  dimension: date {
    type: string
    sql: ${TABLE}.date ;;
  }

  dimension: orders_count {
    type: number
    sql: ${TABLE}.`orders.count` ;;
  }

  dimension: orders_status {
    type: string
    sql: ${TABLE}.`orders.status` ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
