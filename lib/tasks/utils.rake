namespace :utils do
  
  desc "Popular banco de dados."
  task seed: :environment do
    puts "Gerando tipos de contatos (Contacts)" #WORKING
      10.times do |i|
        Contact.create!(
	        name: Faker::Name.name,
	        email: Faker::Internet.email,
	        kind: Kind.all.sample, 
	        rmk: LeroleroGenerator.sentence(1)
        )
      end
    puts "Gerado tipos de contato (Contacts) [OK]"
    
    
    puts "Gerando os endereços (Addresses)"
      Contact.all.each do |contact|
        Address.create!(
            street: Faker::Address.street_address,
            city: Faker::Address.city,
            state: Faker::Address.state_abbr,
            contact: contact
          )
        end
    puts "Gerado os endereços (Addresses) [OK]"
  
  
    puts "Gerando os telefones (Phones)" # WORKING
      Contact.all.each do |contact|
          Random.rand(1..5).times do |i| #utilizado p/ rodar e sortear numeros de telefones aleatórios.
            Phone.create!(
              phone: Faker::PhoneNumber.cell_phone,
              contact: contact
            )
          end
        end
    puts "Gerado os telefones (Phones) [OK]"

    
    puts "Gerando os Hospitais (Hospitals)"
       10.times do |i|
        Hospital.create!(
          name: Faker::Company.name,
          street: Faker::Address.street_address,
          city: Faker::Address.city,
          state: Faker::Address.state_abbr,
          contact: Contact.all.sample
        )    
      end
    puts "Gerado os hospitais (Hospitals) [OK]"
  
  end


end