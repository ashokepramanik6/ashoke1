# The name of this view in Looker is "Orders"
view: orders {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.orders ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      time_of_day,
      date,
      week,
      month,
      quarter,
      year,
      day_of_week,
      day_of_week_index,
      day_of_year
    ]
    sql: ${TABLE}.created_at ;;
  }
  measure: xyx {
    type: number
    sql: CAST(${created_time} As Integer) ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Status" in Explore.

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }
  dimension: is_big_order {
    type: yesno
    sql: ${status} = 'cancelled' ;;
  }
# This is correct##
  measure: total_boxes_needed {
    type: number
    sql: CASE WHEN ${is_big_order} THEN 2 ELSE 1 END ;;
  }
  dimension: New_status {
    type: string
    sql: ${status} ;;
    html: {% if value == "cancelled" %}
    <p style="color: black; background-color: lightblue; font-size: 100%; text-align: center;"> {{rendered_value}} </p>
    {% elsif value == "pending" %}
    <p style="color: black; background-color: #B9C1BD; font-size: 25px; text-align: left;"> {{ rendered_value }} </p>
    {% else %}
    <div style="line-height: 1; font-size: 200%; background-color: red; text-align: left; color: black;">
    <p style="text-align: left;">{{rendered_value}} </p>
    </div>
    {% endif %};;
  }

  dimension: traffic_source {
    type: string
    sql: ${TABLE}.traffic_source ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, users.id, users.first_name, users.last_name, order_items.count]

  }

  # dimension: name2 {
  #   type: string
  #   sql: ${New_status} ;;
  #   html:<a href="https://gcpl230.cloud.looker.com/dashboards/67?ID=0&Name={{ _filters['orders.created_date'] | url_encode }}">{{value}}</a>;;
  # }
}
