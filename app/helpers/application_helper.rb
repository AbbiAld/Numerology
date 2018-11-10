module ApplicationHelper
	def people_table_split(people)
		if people.count.even?
			@people_half = (people.count)/2
		else
			@people_half = (people.count)/2 + 1
		end
		@people_half
	end


	def people_form_heading(person)
		if person.new_record?
			@heading = "Add a Person"
		else
			@heading = "Update Person"
		end
		@heading
	end

	def people_form_method(person)
		if person.new_record?
			@method = "post"
		else
			@method = "put"
		end
		@method
	end

	def people_form_action(person)
		if person.new_record?
			@action = "/people"
		else
			@action = "/people/#{person.id}"
		end
		@action
	end

	def people_form_class(person)
		if person.new_record?
			@class = "new-person"
		else
			@class = "edit-person"
		end
		@class
	end

	def people_form_id(person)
		if person.new_record?
			@id = "new-person"
		else
			@id = "person-#{person.id}"
		end
		@id
	end

	def people_form_button(person)
		if person.new_record?
			@button = "Create Person"
		else
			@button = "Update Person"
		end
		@button
	end
end
