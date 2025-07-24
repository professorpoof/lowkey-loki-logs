require 'json'
require_relative '../logql/errors'

dashboard = {
  title: 'App Logs Dashboard',
  panels: [
    {
      title: 'Error Logs',
      type: 'logs',
      datasource: 'Loki',
      targets: [
        {
          expr: LogQL::Errors.for_app('myapp'),
          legend_format: 'Errors'
        }
      ]
    }
  ]
}

puts JSON.pretty_generate(dashboard)
