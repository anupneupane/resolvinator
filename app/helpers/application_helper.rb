module ApplicationHelper
  def flash_class(level)
    case level
      when :notice then 'info'
      when :error then 'error'
      when :alert then 'warning'
      when :warning then 'warning'
    end
  end

  def render_escaped(arg)
    j(render arg)
  end
end
