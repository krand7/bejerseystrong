module VolunteerResourcesHelper
  def volunteer_resource_file_url(volunteer_resource)
    if volunteer_resource.file.present?
      file_volunteer_resource_path(volunteer_resource)
    else
      nil
    end
  end
end
