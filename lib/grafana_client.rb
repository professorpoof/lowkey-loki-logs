module GrafanaClient
  def self.push_dashboard(json)
    # Future: implement API POST to /api/dashboards/db
    puts "[DEBUG] Would push dashboard: #{json[0..80]}..."
  end
end
