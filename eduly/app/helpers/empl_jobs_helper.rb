module EmplJobsHelper
    def check_boolean(value)
        if false == value
            @bool = "No"
        else
            @bool = "Yes"
        end
    end

    def company_logo_for(job)
        if job.empl_organisation.company_logo?
            image_tag job.empl_organisation.company_logo.url(:thumb)
        else
            image_tag "company-logo.png"
        end
    end
end
