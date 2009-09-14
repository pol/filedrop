# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def breadcrumbs(trail = nil)
    return if trail.nil?
    trail.map { |c| 
      c.values[0].nil? ? c.keys[0].titleize : link_to(c.keys[0].titleize, c.values[0]) 
    }.join(' &gt; ')
  end
end
