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