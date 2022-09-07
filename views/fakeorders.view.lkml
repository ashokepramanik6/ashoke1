view: fakeorders {
  sql_table_name: demo_db.fakeorders ;;

  dimension: customer_id {
    type: string
    sql: ${TABLE}.customer_id ;;
  }

  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension: order_price {
    type: number
    sql: ${TABLE}.order_price ;;
  }

  measure: count {
    type: count
    drill_fields: [orders.id]
  }
}
