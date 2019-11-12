class ControleDeAcesso
	include Capybara::DSL

	def verifyAvailableOptionsForUnloggedUsers
		within('div#navbarSupportedContent') do 
			find('.nav-link', text: 'Entrar')
			find('.nav-link', text: 'Inscrever')
		end
	end

	def verifyAvailableOptionsForUserWithoutProfile
		within('div#navbarSupportedContent') do 
			find('.nav-link', text: 'Questões')
			find('.nav-link', text: 'Turmas')
			find('.nav-link', text: 'Exames')
			find('.nav-link', text: 'Sair')
			find('.nav-link', text: 'Inscrever')
		end
	end

	def verifyRestrictedPermission
		find('.nav-link', text: 'Questões').click
		find('.card-title', text: 'Minha Lista de Questões')
		find('.card-body', text: 'Entre em contato com o coordenador da disciplina')

		find('.nav-link', text: 'Turmas').click
		find('.card-title', text: 'Listar Turmas')
		find('.card-body', text: 'Somente professores cadastrados em disciplinas')
		find('.card-body', text: 'Entre em contato com o coordenador da disciplina')
                        
		find('.nav-link', text: 'Exames').click
		find('.card-title', text: 'Minha lista de Exames')
		find('.card-body', text: 'Somente professores cadastrados em discipinas e em turmas')
		find('.card-body', text: 'Entre em contato com o coordenador da disciplina')                
	end

	def verifyIfProfileCanCreateClasses
		find('.nav-link', text: 'Turmas').click
		find('a.btn.btn-primary').click
		raise "No permission to create classes" if page.current_url != 'http://177.104.60.16:8000/course/classroom/create/'
	end

	def verifyIfProfileCanCreateQuestions
		all('.nav-link', text: 'Questões')[1].click
		find('a.btn.btn-primary').click
		raise "No permission to create questions" if page.current_url != 'http://177.104.60.16:8000/topic/question/create/'
	end

	def verifyIfProfileCanCreateExams
		begin
			find('.nav-link', text: 'Exames').click
		rescue
			all('.nav-link', text: 'Exames')[0].click
		end
		find('a.btn.btn-primary').click
		raise "No permission to create questions" if page.current_url != 'http://177.104.60.16:8000/exam/exam/create/'
	end

	def verifyIfProfileCanUpdateDisciplines
		find('.nav-link', text: 'Disciplinas').click
		find('.btn.btn-outline-primary.btn-sm').click
		raise "No permission to update disciplines" if page.current_url != 'http://177.104.60.16:8000/course/discipline/1/update'
	end

	def verifyIfProfileCanUpdateTopics
		find('.nav-link', text: 'Tópicos').click
		find('.btn.btn-outline-primary.btn-sm').click 
		raise "No permission to update topics" if page.current_url != 'http://177.104.60.16:8000/topic/topic/1/update'
		find('.btn.btn-outline-primary').click
		find('.btn.btn-primary').click
		raise "No permission to create topics" if page.current_url != 'http://177.104.60.16:8000/topic/topic/create/'
	end

	def verifyIfProfileCanUpdateAndCreateInstitutes
		find('.nav-link', text: 'Institutos').click
		find('.btn.btn-outline-primary.btn-sm').click 
		raise "No permission to update institutes" if page.current_url != 'http://177.104.60.16:8000/course/institute/1/update'
		find('.btn.btn-outline-primary').click
		find('.btn.btn-primary').click
		raise "No permission to create institutes" if page.current_url != 'http://177.104.60.16:8000/course/institute/create/'
	end

	def verifyIfProfileCanUpdateAndCreateCourses
		find('.nav-link', text: 'Cursos').click
		find('.btn.btn-outline-primary.btn-sm').click 
		raise "No permission to update courses" if page.current_url != 'http://177.104.60.16:8000/course/course/1/update'
		find('.btn.btn-outline-primary').click
		find('.btn.btn-primary').click
		raise "No permission to create courses" if page.current_url != 'http://177.104.60.16:8000/course/course/create/'
	end

	def verifyIfProfileCanAccessAdminMenu
		find('.nav-link', text: 'Admin').click
		raise "No permission to access Admin menu" if page.current_url != 'http://177.104.60.16:8000/admin/'
	end
end