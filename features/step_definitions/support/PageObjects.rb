class Home
	include Capybara::DSL

  def checkMenus
  	within(all('ul.sidebar-nav')[0]) do
  		raise "Missing webMCTest option! " if all('li')[0].text != 'webMCTest'
  		raise "Missing Institutos option! " if all('li')[1].text != 'Institutos'
  		raise "Missing Cursos option! " if all('li')[2].text != 'Cursos'
  		raise "Missing Disciplinas option! " if all('li')[3].text != 'Disciplinas'
  	end

  	within(all('ul.sidebar-nav')[1]) do
  		raise "Missing menu Entrar! " if all('li')[0].text != 'Entrar'
  		raise "Missing menu Inscrever! " if all('li')[1].text != 'Inscrever'
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
  		$poLogin.checkFields #pendente
  	when 'register'
  		$poRegister.checkFields
  	end	
  end
end

class Login
	include Capybara::DSL

	def clickEntrar
		within(all('ul.sidebar-nav')[1]) do
			login = page.find('a[href="/account/login/?next=/topic/"]')
			login.click
		end		
	end

	def checkFields
		within('div.col-sm-10 ') do
			raise unless find('label', text: 'Endereço de email:')
			raise unless find('input#id_username')
			raise unless find('label', text: 'Senha:')
			raise unless find('input#id_password')
			raise unless all('div')[2].find('input')
		end		
	end

	def clickLogin
		within('div.col-sm-10 ') do
			all('div')[2].find('input').click
		end	
	end

	def loginAdminUser
		within('div.col-sm-10 ') do 
			@user = 'fzampirolli@ufabc.edu.br'
			password = 'ufabc1234'
			find('input#id_username').send_keys @user
			find('input#id_password').send_keys password
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
		within(all('ul.sidebar-nav')[1]) do
			register = page.find('a[href="/topic/signup"]')
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

end