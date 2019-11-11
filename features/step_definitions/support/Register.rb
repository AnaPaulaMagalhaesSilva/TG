class Register
	include Capybara::DSL

	def clickRegister
		within('#navbarSupportedContent') do
			register = find('.nav-link', text: 'Inscrever')
			register.click
		end
	end

	def checkFields
		within('div.col-sm-10') do
			raise "Could not find correct page's title! " if find('h2').text != 'Inscrever'
			raise unless find('label', text: 'Email')
			raise unless find('input#id_email')
			raise unless find('label', text: 'Primeiro nome:')
			raise unless find('input#id_first_name')
			raise unless find('label', text: 'Último nome:')
			raise unless find('input#id_last_name')
			raise unless find('label', text: 'Senha:')
			raise unless find('input#id_password1')
			raise unless find('label', text: 'Confirmação de senha:')
			raise unless find('input#id_password2')
		end
	end

	def checkExceptions
		within('div.col-sm-10') do
			find('button', text: 'Sign up').click
		end
	end

	def fillMail
		email = find('input#id_email')
		email.send_keys $poAuxiliar.generateNewMail		
	end

	def fillName
		first_name = find('input#id_first_name')
		last_name = find('input#id_last_name')
		first_name.send_keys 'Teste'
		last_name.send_keys 'Register ' + $poAuxiliar.generateNewDate
	end

	def fillPass(option, keys)
		if keys == "same"
			case option 
			when "unfollowing"
				password = 'ana1234'
				passConfirmation = 'ana1234' 
			when "following" 
				password = 'ana12345'
				passConfirmation = 'ana12345' 
			end
		elsif keys == "differents"
			case option
			when "following" 
				password = 'ana12346'
				passConfirmation = 'ana12345' 
			when "unfollowing" 
				password = 'ana123'
				passConfirmation = 'ana124'
			end
		end
		pass = find('input#id_password1')
		pass_confirmation = find('input#id_password2')
		pass.send_keys password
		pass_confirmation.send_keys passConfirmation
	end

	def clickBtnRegister
		button = find('.btn.btn-primary')
		button.click
	end

	def verifyShortPassErrorMessage
		begin
			find('p', text: "Ela precisa conter pelo menos 8 caracteres")
		rescue Exception => e
			raise "Could not find correct message error! " + e.to_s
		end
	end

	def verifyDifferentsPassErrorMessage
		begin
			find('p', text: "Os dois campos de senha não combinam.")
		rescue Exception => e
			raise "Could not find correct message error! " + e.to_s
		end
	end

	def fillUserAlreadyRegistered
		userData = $poAuxiliar.readCredentials('coordenador')
		email = find('input#id_email')
		@user = userData['login']
		email.send_keys @user
		sleep 5
	end

	def verifyUserAlreadyRegistered
		begin
			find('p', text: "Usuário com este Endereço de email já existe.")
		rescue Exception => e
			raise "Could not find correct message error! " + e.to_s
		end
	end

	def fillUserLongEmail
		email = find('input#id_email')
		email.send_keys $poAuxiliar.generateTooLongMail 			
	end

	def fillUserNotUfabcDomain
		email = find('input#id_email')
		email.send_keys 'ana@gmail.com'
	end

	def verifyUserNotUfabcDomain
		begin
			find('div#info', text: 'Make sure email is intitutional:')
		rescue Exception => e
			raise "Could not finde correct message error! " + e.to_s
		end
	end
end