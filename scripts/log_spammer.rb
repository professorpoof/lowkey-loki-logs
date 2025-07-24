require 'time'

loop do
  log = "[#{Time.now.iso8601}] Simulated log line - level=info"
  File.open('logs/fake.log', 'a') { |f| f.puts(log) }
  sleep 2
end
