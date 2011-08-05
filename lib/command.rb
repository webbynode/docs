def command(cmd, options)
  html = []
  
  html << "<div class='command'>"
  html << "<h2><code>#{cmd}</code></h2>"
  html << "<div class='command_body'>"
  html << "<div class='description'>#{options[:desc]}</div>"
  
  usage = "#{cmd} "
  if options[:parameters]
    usage = usage + options[:parameters].map { |p| p[1] =~ /optional$/ ? "[#{p[0]}]" : p[0] }.join(" ")
  end
  usage = "#{usage} [options]" if options[:options]
  
  html << "<div class='usage'><b>USAGE</b><p><code>#{usage}</code></p></div>"

  if options[:parameters]
    html << "<div class='parameters'><b>PARAMETERS</b>"
    html << "<table>"
    options[:parameters].each_pair do |param, desc|
      html << "<tr><td class='param'><code>#{param}</code></td><td>#{desc}</td></tr>"
    end
    html << "</table>"
    html << "</div>"
  end
  
  if options[:options]
    html << "<div class='options'><b>OPTIONS</b>"
    html << "<table>"
    options[:options].each_pair do |param, desc|
      html << "<tr><td class='param'><code>#{param}</code></td><td>#{desc}</td></tr>"
    end
    html << "</table>"
    html << "</div>"
  end
  html << "</div>"
  html << "</div>"
  
  html.join("\n")
end
