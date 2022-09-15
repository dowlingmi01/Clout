module ApplicationHelper

	def source_helper
		if session[:source]
			greeting = "Thanks for visiting me from #{session[:source]}"
			content_tag(:p, greeting, class: "source-greeting")
		end
	end

	def login_helper style

        if current_user.is_a?(GuestUser)     
            (link_to "Sign up", new_user_registration_path, class: style) + " ".html_safe + 
            (link_to "Sign in", new_user_session_path, class: style)
        else
        	link_to "Edit User", edit_user_registration_path, class: style
			link_to "Logout", destroy_user_session_path, method: :delete, class: style
		end
	end

	def full_title(page_title = " ")
		default_title = "Clout Cloud"
		if page_title.empty?
			default_title
		else
			"#{page_title} | #{default_title}"
		end
	end

	def time_format(survey_date)
		survey_date.strftime("%A, %d %b %Y %l:%M %p")
	end

	def survey_status(survey)
		if survey.end_date <= Date.today
			content_tag(:span, "", class: "past")
		else
			content_tag(:span, "", class: "upcoming")
		end		
	end

	def admins_only(&block)
		block.call if current_user.try(:admin?)		
	end

end
