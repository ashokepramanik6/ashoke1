# The name of this view in Looker is "Order Items"
view: order_items {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.order_items ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
parameter: date_granularity {
  type: string
  allowed_value: {label:"ashoke_demo" value:"{{ _user_attributes['ashoke_demo'] }}"}
  allowed_value: {label:"Weekly" value:"week"}
  allowed_value: {label:"Monthly" value:"month"}
}
dimension: dynamic_timeframe {
  type: string
  # sql: case when {% parameter date_granularity %} = 'day' then cast(${returned_date} as text)
  # when {% parameter date_granularity %} = 'week' then ${returned_week}
  # else ${returned_month} end;;
  #------OR,------
  ##---if date_granularity is string then "'day'"and if unquoted then "day"---**
  # sql: {% if date_granularity._parameter_value == "'day'" %} ${returned_date}
  # {% elsif date_granularity._parameter_value == "'week'" %} ${returned_week}
  # {% else %} ${returned_month} {% endif %};;

  # html: {% if date_granularity._parameter_value == "'day'" %} ${returned_date}
  # <font color="green">{{returned_date}}</font>
  # {% elsif date_granularity._parameter_value == "'week'" %} ${returned_week}
  # <font color="red">{{returned_week}}</font>
  # {% else %} <font color="black">{{returned_month}}</font> {% endif %};;
}

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Inventory Item ID" in Explore.

  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: returned {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.returned_at ;;
  }

  dimension: sale_price {
    hidden: yes
    type: number
    sql: ${TABLE}.sale_price ;;
    value_format_name: usd
  }

  parameter: select_gender {
    type: string
    # allowed_value: { label: "Man" value: "m"}
    # allowed_value: { label: "Woman" value: "f"}
    ##---OR----
    suggest_dimension: users.gender
    suggest_explore: users

  }
  measure: total_sales_from_gender{
    type: sum
    sql: case when ${users.gender}={%parameter select_gender%} then ${sale_price} else null end ;;
  }

  measure: total_revenue {
    type: sum
    sql: ${sale_price} ;;
    value_format_name: usd
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_sale_price {
    type: sum
    sql: ${sale_price} ;;
 }
  measure: type_num_two_measure {
    description: "It must be num and if val_format is decimal_1 them div by 100"
    type: number
    sql: ${total_sale_price}/NULLIF(${users.count},0) ;;
    value_format_name:percent_1
  }

  measure: average_sale_price {
    type: average
    sql: ${sale_price} ;;

     html: <font size="-3"{{ linked_value }}</font> ;; ##--increasing font size

    # html:
    # <div style="width:100%"><details>
    # <summary style="outline:none">{{ average_sale_price._linked_value }}</summary>
    # Sale Price: {{ total_sale_price._linked_value }}</br>
    # Total Revenue: {{ total_revenue._linked_value }}</details>
    # </div>;;

  }

  measure: count {
    type: count
    drill_fields: [id, orders.id, -inventory_items.id]
  }
}
