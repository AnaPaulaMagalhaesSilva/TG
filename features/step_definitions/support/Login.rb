class Login
	include Capybara::DSL

	def clickEntrar
		within('#navbarSupportedContent') do
			login = find('.nav-link', :text => 'Entrar')
			login.click
		end		
	end

	def checkFields
		within('div.card-body') do
			raise "Missing mail's label! " unless find('.input-group-prepend', text: 'Endereço de email:')
			raise "Missing mail's field! " unless find('input#id_username')
			raise "Missing password's label! " unless find('label', text: 'Senha:')
			raise "Missing password's field! " unless find('input#id_password')
			raise "Missing login button!  " unless find('.btn.btn-primary', text: 'Entrar')
			raise "Missing forgot password button! " unless find('.btn.btn-warning', text: 'Perdeu a senha?')
		end		
	end

	def clickLogin
		within('div.card-body') do
			find('.btn.btn-primary').click
		end	
	end

	def loginCoordUser
		userData = $poAuxiliar.readCredentials('coordenador')
		within('div.card-body') do 
			@user = userData['login']
			password = userData['password']
			find('input#id_username').send_keys @user
			find('input#id_password').send_keys password
		end
	end

	def checkIfIamlogged
		user = @user.split('@')[0]
		within('#navbarSupportedContent') do
			raise unless find('a.nav-link', text: user)	
		end
	end
end