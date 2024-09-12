module RegistrationHelper
  def sort_link(column, title = nil, html_options = {})
    title ||= column.titleize
    direction = (column == params[:sort] && params[:direction] == "asc") ? "desc" : "asc"
    link_to title, registrations_path(sort: column, direction: direction), html_options.merge(data: { turbo_frame: "registrations" })
  end
end
