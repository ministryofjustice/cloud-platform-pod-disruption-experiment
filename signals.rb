#!/usr/bin/env ruby

$stdout.sync = true

def log(msg)
  puts "#{Time.now.strftime('%Y-%m-%d %H:%M:%S')} #{msg}"
end

Signal.trap("TERM") do
  log "TERM received"
  delay = 60
  log "Sleeping for #{delay} seconds, then shutting down"
  sleep delay
  log "shutting down"
  exit(0)
end

while true
  sleep 1
  log("heartbeat...")
end
