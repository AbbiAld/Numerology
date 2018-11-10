class Person < ActiveRecord::Base
	validates_presence_of :first_name, :last_name, :birthdate

	def self.get_birth_path_num(birthdate)
		i = 0
		digit_sum = 0
		while i < birthdate.length
			digit_sum += birthdate[i].to_i
			i+= 1
		end
		birth_number = digit_sum

		if birth_number > 9
			while birth_number > 9
				i = 0
				digit_sum = 0
				birth_number = birth_number.to_s
				while i < birth_number.length
					digit_sum += birth_number[i].to_i
					i+= 1
				end
				birth_number = digit_sum
			end
		end
		birth_number;
	end

	def self.valid_birthdate(input)
		if (input.match(/[0-9]{8}/)) != nil
			return true
		end
	end

	def self.message(birth_path_number)
		case birth_path_number
			when 1 
				return "Your numerology number is #{birth_path_number}. \nOne is the leader. The number one indicates the ability to stand alone, and is a strong vibration. Ruled by the Sun."
			when 2
				return "Your numerology number is #{birth_path_number}. \nThis is the mediator and peace-lover. The number two indicates the desire for harmony. It is a gentle, considerate, and sensitive vibration. Ruled by the Moon."
			when 3
				return "Your numerology number is #{birth_path_number}. \nNumber Three is a sociable, friendly, and outgoing vibration. Kind, positive, and optimistic, Three's enjoy life and have a good sense of humor. Ruled by Jupiter."
			when 4
				return "Your numerology number is #{birth_path_number}. \nThis is the worker. Practical, with a love of detail, Fours are trustworthy, hard-working, and helpful. Ruled by Uranus."
			when 5
				return "Your numerology number is #{birth_path_number}. \nThis is the freedom lover. The number five is an intellectual vibration. These are 'idea' people with a love of variety and the ability to adapt to most situations. Ruled by Mercury."
			when 6
				return "Your numerology number is #{birth_path_number}. \nThis is the peace lover. The number six is a loving, stable, and harmonious vibration. Ruled by Venus."
			when 7
				return "Your numerology number is #{birth_path_number}. \nThis is the deep thinker. The number seven is a spiritual vibration. These people are not very attached to material things, are introspective, and generally quiet. Ruled by Neptune."
			when 8
				return "Your numerology number is #{birth_path_number}. \nThis is the manager. Number Eight is a strong, successful, and material vibration. Ruled by Saturn."
			when 9
				return "Your numerology number is #{birth_path_number}. \nThis is the teacher. Number Nine is a tolerant, somewhat impractical, and sympathetic vibration. Ruled by Mars."
		end
	end

	def self.format_birthdate(birthdate)
		birthdate = Date.new.strptime(birthdate, "%m/%d/%Y")
	end
end
