# The name of this view in Looker is "Products"
view: products {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.products ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Brand" in Explore.

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
    # link: {
    #   label: "Google search for {{ value }}"
    #   url: "https://www.google.com/search?q={{ value }}"
    # }
  }
  filter: select_brand{
    type: string
    suggest_dimension: brand
    suggest_explore: products

  }
  dimension: is_selected_brand {
    hidden: yes
    type: yesno
    sql: {% condition select_brand %} ${brand} {% endcondition %} ;;
  }
  # measure: total_sales_from_brand{
  #   type: sum
  #   sql: ${total_retail_price} ;;
  #   filters: [is_selected_brand: "yes"]
  # }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }
  # filter: select_categories {
  #   type: string
  #   suggest_dimension: category
  # }
  # dimension: group_category {
  #   type: string
  #   sql: case
  #   when {% condition select_categories %} ${category} {% endcondition %}
  #   then ( select group_concat (distinct ${category} separator ', ')
  #   from ${TABLE}
  #   where {% condition select_categories %} ${category} {% endcondition %})
  #   else "All Other Category"
  #   end;;
  # }


  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }

  dimension: retail_price {
    type: number
    sql: ${TABLE}.retail_price ;;
  }
  measure: shortscount {
    type: count_distinct
    sql: case
        when ${category}='Shorts'
        THEN ${id}
        else null
        end ;;
  }
  filter: templatedfilter {
    type: string


  }
  measure: dynamiccount {
    type: count_distinct
    sql: case
          when {% condition templatedfilter %} ${category} {% endcondition %}
          then ${id}
          else null
          end ;;


  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_retail_price {
    type: sum
    sql: ${retail_price} ;;
  }

  measure: average_retail_price {
    type: average
    sql: ${retail_price} ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

  measure: count {
    type: count
    drill_fields: [id, item_name, inventory_items.count, product_facts.count]
  }
}
