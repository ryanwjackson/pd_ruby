# frozen_string_literal: true

def print_debug(thing = nil, backtrace_offset: 0, **keywords)
  backtrace_line = caller[backtrace_offset].split(':')[0..1].join(':')
  thing = keywords if thing.eql?(nil) && keywords.any?
  thing = thing.inspect unless thing.is_a?(String)
  color = PDRuby.color_for(backtrace_line)

  puts(
    (
      'PD: ' + thing
    ).colorize(color) +
      ' @ ' + backtrace_line.to_s.colorize(color)
  )
  puts "\n"
  thing
end

def pd(thing = nil, options = {})
  options[:backtrace_offset] ||= 1
  print_debug(thing, **options)
end
