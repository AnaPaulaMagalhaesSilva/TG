class Home
	include Capybara::DSL

	def checkHeader
		within('#navbarSupportedContent') do
  		raise "Missing Institutos option! " unless find('.nav-link', :text => 'Institutos') 
  		raise "Missing Institutos option! " unless find('.nav-link', :text => 'Cursos') 
  		raise "Missing Institutos option! " unless find('.nav-link', :text => 'Disciplinas')
  		raise "Missing Institutos option! " unless find('.nav-link', :text => 'Entrar')
  		raise "Missing Institutos option! " unless find('.nav-link', :text => 'Inscrever')
  	end
  end
	
	def clickMenu(option)
  	case option
  		when 'Entrar'
  			$poLogin.clickEntrar
  		when 'Inscrever'
  			$poRegister.clickRegister
  	end
  end

  def checkPage(option)
  	case option
  		when 'login'
  			$poLogin.checkFields 
  		when 'register'
  			$poRegister.checkFields
  	end	
  end
end

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
		within('div.col-sm-10 ') do
			all('div')[2].find('input').click
		end	
	end

	def loginCoordUser
		userData = $poAuxiliar.readCredentials('coordenador')
		within('div.card-body') do 
			@user = userData['login']
			password = userData['password']
			find('input#id_username').send_keys @user
			find('input#id_password').send_keys password
			find('.btn.btn-primary').click
		end
	end

	def checkIfIamlogged
		user = @user.split('@')[0]
		within(all('ul.sidebar-nav')[1]) do
			raise unless find('li', text: 'Usuário: ' + user)	
		end
	end
end

class Register
	include Capybara::DSL

	def clickRegister
		within('#navbarSupportedContent') do
			register = find('.nav-link', text: 'Inscrever')
			register.click
			sleep 3
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
			sleep 4
		end
	end

	def fillMail
		email = find('input#email')
		email.send_keys generateNewMail		
	end

	def generateNewMail
		tdaydate = DateTime.now.to_date.to_s
		puts tdaydate
		emailpadrao = 'ana.teste@gmail.com' 
		newemail = emailpadrao.split('@')[0] + "+#{tdaydate}@" + emailpadrao.split('@')[1]
		puts newemail
		return newemail
	end
end

class Auxiliar
	def readCredentials(userType)
		filepath = "./features/step_definitions/data/credentials.json"
		file = File.read(filepath)
		data_hash = JSON.parse(file)
		case userType
		when 'coordenador'
			data_hash['coordenador']
		when 'professor'
			data_hash['professor']
		when 'estudante'
			data_hash['estudante']
		when 'administrador'
			data_hash['administrador']
		end
	end
end