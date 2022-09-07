#X# Conversion failed: failed to parse YAML.  Check for pipes on newlines

# view: div_stylebackgroundimage_urldatatexthtmlimgsrc1
#   sql_table_name: demo_db.<div style="background-image: url(data:text/html,<img/src=1>)">

#   fields:

#   - dimension: div_stylebackground
#     type: string
#     sql: ${TABLE}.`<div style="background->`

#   - measure: count
#     type: count
#     drill_fields: []
