
  view: fact_sql_dt {
    derived_table: {
      #--------------PDT-------------------------
     sql_trigger_value: select max(order_items_id) from ${order_items.SQL_TABLE_NAME} ;;
    distribution_style: all
    # persist_for: "4 hour"


    #---------------------------------------------


      sql: SELECT
          "id" AS "order_items.id",
          COALESCE(SUM("sale_price"), 0) AS "order_items.total_sale_price"
      FROM
          "public"."order_items" AS "order_items"
      GROUP BY
          1
      ORDER BY
          2 DESC
        LIMIT 50
       ;;
}
    measure: count {
      type: count
      drill_fields: [detail*]
    }

    dimension: order_items_id {
      type: number
      sql: ${TABLE}."order_items.id" ;;
      primary_key: yes
    }

    dimension: order_items_total_sale_price {
      type: number
      sql: ${TABLE}."order_items.total_sale_price" ;;
    }

    set: detail {
      fields: [order_items_id, order_items_total_sale_price]
    }
  }
