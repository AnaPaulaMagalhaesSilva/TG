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

	def generateNewDate
		tdaydate = DateTime.now.to_date.to_s
		return tdaydate	
	end

	def generateNewTime
		time = Time.new
		timeNow = time.to_s.split(' ')[1].gsub(':', '')
		puts timeNow
		return timeNow
	end

	def generateNewMail
		emailpadrao = 'test+@ufabc.edu.br' 
		newemail = emailpadrao.split('@')[0] + generateNewTime + '@' + emailpadrao.split('@')[1]
		puts newemail
		return newemail
	end

	def generateTooLongMail
		emailpadrao = 'test.registers+@ufabc.edu.br' 
		newemail = emailpadrao.split('@')[0] + generateNewDate + '@' + emailpadrao.split('@')[1]
		puts newemail
		return newemail
	end
end