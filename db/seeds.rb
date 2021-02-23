# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Generate a list of degree programs - no duplicates made if rake db:seed is rerun.
degrees = [{name: 'Other'}, {name: 'Certificate'}, {name: 'Associate'}, {name: 'Bachelor'}, {name: 'Master'}, {name: 'Post-Master'}, {name: 'Doctor'}, {name: 'Engineer'}]

degrees.each do |degree|
  Degree.find_or_create_by(degree)
end

# Generate a list of credentials - no duplicates made if rake db:seed is rerun.
credentials = [
                       {
                           "name": "A.A.",
                           "description": "Associate of Arts",
                           "degree_id": 3,
                           "auto_approve": 1
                       },
                       {
                           "name": "A.S.",
                           "description": "Associate of Science",
                           "degree_id": 3,
                           "auto_approve": 1
                       },
                       {
                           "name": "A.A.A.",
                           "description": "Associate of Applied Arts",
                           "degree_id": 3,
                           "auto_approve": 1
                       },
                       {
                           "name": "A.A.S.",
                           "description": "Associate of Applied Science",
                           "degree_id": 3,
                           "auto_approve": 1
                       },
                       {
                           "name": "A.D.N.",
                           "description": "Associate in Nursing",
                           "degree_id": 3,
                           "auto_approve": 1
                       },
                       {
                           "name": "A.B.",
                           "description": "Bachelor of Arts",
                           "degree_id": 4,
                           "auto_approve": 1
                       },
                       {
                           "name": "B.A.",
                           "description": "Bachelor of Arts",
                           "degree_id": 4,
                           "auto_approve": 1
                       },
                       {
                           "name": "B.A.M.",
                           "description": "Bachelor of Applied Mathematics",
                           "degree_id": 4,
                           "auto_approve": 1
                       },
                       {
                           "name": "B.Arch.",
                           "description": "Bachelor of Architecture",
                           "degree_id": 4,
                           "auto_approve": 1
                       },
                       {
                           "name": "B.B.A.",
                           "description": "Bachelor of Business Administration",
                           "degree_id": 4,
                           "auto_approve": 1
                       },
                       {
                           "name": "B.C.E.",
                           "description": "Bachelor of Civil Engineering",
                           "degree_id": 4,
                           "auto_approve": 1
                       },
                       {
                           "name": "B.Ch.E.",
                           "description": "Bachelor of Chemical Engineering",
                           "degree_id": 4,
                           "auto_approve": 1
                       },
                       {
                           "name": "B.E.D.",
                           "description": "Bachelor of Education",
                           "degree_id": 4,
                           "auto_approve": 1
                       },
                       {
                           "name": "B.E.E.",
                           "description": "Bachelor of Electrical Engineering",
                           "degree_id": 4,
                           "auto_approve": 1
                       },
                       {
                           "name": "B.F.A.",
                           "description": "Bachelor of Fine Arts",
                           "degree_id": 4,
                           "auto_approve": 1
                       },
                       {
                           "name": "B.J.",
                           "description": "Bachelor of Journalism",
                           "degree_id": 4,
                           "auto_approve": 1
                       },
                       {
                           "name": "B.Lit.",
                           "description": "Bachelor of Literature",
                           "degree_id": 4,
                           "auto_approve": 1
                       },
                       {
                           "name": "B.M.",
                           "description": "Bachelor of Music",
                           "degree_id": 4,
                           "auto_approve": 1
                       },
                       {
                           "name": "B.M.S.",
                           "description": "Bachelor of Marine Science",
                           "degree_id": 4,
                           "auto_approve": 1
                       },
                       {
                           "name": "B.N.",
                           "description": "Bachelor of Nursing",
                           "degree_id": 4,
                           "auto_approve": 1
                       },
                       {
                           "name": "B.Pharm.",
                           "description": "Bachelor of Pharmacy",
                           "degree_id": 4,
                           "auto_approve": 1
                       },
                       {
                           "name": "B.S.",
                           "description": "Bachelor of Science",
                           "degree_id": 4,
                           "auto_approve": 1
                       },
                       {
                           "name": "B.S.B.A.",
                           "description": "Bachelor of Science in Business Administration",
                           "degree_id": 4,
                           "auto_approve": 1
                       },
                       {
                           "name": "B.S.Ed.",
                           "description": "Bachelor of Science in Education",
                           "degree_id": 4,
                           "auto_approve": 1
                       },
                       {
                           "name": "B.S.E.E.",
                           "description": "Bachelor of Science in Electrical Engineering",
                           "degree_id": 4,
                           "auto_approve": 1
                       },
                       {
                           "name": "B.S.N.",
                           "description": "Bachelor of Science in Nursing",
                           "degree_id": 4,
                           "auto_approve": 1
                       },
                       {
                           "name": "B.S.P.",
                           "description": "Bachelor of Professional Studies",
                           "degree_id": 4,
                           "auto_approve": 1
                       },
                       {
                           "name": "Litt.B.",
                           "description": "Bachelor of Letters",
                           "degree_id": 4,
                           "auto_approve": 1
                       },
                       {
                           "name": "LL.B.",
                           "description": "Bachelor of Laws",
                           "degree_id": 4,
                           "auto_approve": 1
                       },
                       {
                           "name": "Ph.B.",
                           "description": "Bachelor of Philosophy",
                           "degree_id": 4,
                           "auto_approve": 1
                       },
                       {
                           "name": "S.B.",
                           "description": "Bachelor of Science",
                           "degree_id": 4,
                           "auto_approve": 1
                       },
                       {
                           "name": "Th.B.",
                           "description": "Bachelor of Theology",
                           "degree_id": 4,
                           "auto_approve": 1
                       },
                       {
                           "name": "D.A.",
                           "description": "Doctor of Arts",
                           "degree_id": 7,
                           "auto_approve": 1
                       },
                       {
                           "name": "D.A.S.",
                           "description": "Doctor of Applied Science",
                           "degree_id": 7,
                           "auto_approve": 1
                       },
                       {
                           "name": "D.B.A.",
                           "description": "Doctor of Business Administration",
                           "degree_id": 7,
                           "auto_approve": 1
                       },
                       {
                           "name": "D.C.",
                           "description": "Doctor of Chiropractic",
                           "degree_id": 7,
                           "auto_approve": 1
                       },
                       {
                           "name": "D.D.",
                           "description": "Doctor of Divinity",
                           "degree_id": 7,
                           "auto_approve": 1
                       },
                       {
                           "name": "D.Ed.",
                           "description": "Doctor of Education",
                           "degree_id": 7,
                           "auto_approve": 1
                       },
                       {
                           "name": "D.L.S.",
                           "description": "Doctor of Library Science",
                           "degree_id": 7,
                           "auto_approve": 1
                       },
                       {
                           "name": "D.M.D.",
                           "description": "Doctor of Dental Medicine",
                           "degree_id": 7,
                           "auto_approve": 1
                       },
                       {
                           "name": "D.M.S.",
                           "description": "Doctor of Medical Science",
                           "degree_id": 7,
                           "auto_approve": 1
                       },
                       {
                           "name": "D.P.A.",
                           "description": "Doctor of Public Administration",
                           "degree_id": 7,
                           "auto_approve": 1
                       },
                       {
                           "name": "D.P.H.",
                           "description": "Doctor of Public Health",
                           "degree_id": 7,
                           "auto_approve": 1
                       },
                       {
                           "name": "D.R.E.",
                           "description": "Doctor of Religious Education",
                           "degree_id": 7,
                           "auto_approve": 1
                       },
                       {
                           "name": "D.S.W.",
                           "description": "Doctor of Social Welfare or Doctor of Social Work",
                           "degree_id": 7,
                           "auto_approve": 1
                       },
                       {
                           "name": "D.Sc.",
                           "description": "Doctor of Science",
                           "degree_id": 7,
                           "auto_approve": 1
                       },
                       {
                           "name": "D.V.M.",
                           "description": "Doctor of Veterinary Medicine",
                           "degree_id": 7,
                           "auto_approve": 1
                       },
                       {
                           "name": "Ed.D.",
                           "description": "Doctor of Education",
                           "degree_id": 7,
                           "auto_approve": 1
                       },
                       {
                           "name": "J.D.",
                           "description": "Doctor of Laws",
                           "degree_id": 7,
                           "auto_approve": 1
                       },
                       {
                           "name": "J.S.D.",
                           "description": "Doctor of Juristic Science",
                           "degree_id": 7,
                           "auto_approve": 1
                       },
                       {
                           "name": "L.H.D.",
                           "description": "Doctor of Humane Letters",
                           "degree_id": 7,
                           "auto_approve": 1
                       },
                       {
                           "name": "LL.D.",
                           "description": "Doctor of Laws",
                           "degree_id": 7,
                           "auto_approve": 1
                       },
                       {
                           "name": "M.D.",
                           "description": "Doctor of Medicine",
                           "degree_id": 7,
                           "auto_approve": 1
                       },
                       {
                           "name": "O.D.",
                           "description": "Doctor of Optometry",
                           "degree_id": 7,
                           "auto_approve": 1
                       },
                       {
                           "name": "Pharm.D.",
                           "description": "Doctor of Pharmacy",
                           "degree_id": 7,
                           "auto_approve": 1
                       },
                       {
                           "name": "Ph.D.",
                           "description": "Doctor of Philosophy",
                           "degree_id": 7,
                           "auto_approve": 1
                       },
                       {
                           "name": "Sc.D.",
                           "description": "Doctor of Science",
                           "degree_id": 7,
                           "auto_approve": 1
                       },
                       {
                           "name": "S.J.D.",
                           "description": "Doctor of Juridical Science or Doctor of the Science of Law",
                           "degree_id": 7,
                           "auto_approve": 1
                       },
                       {
                           "name": "S.Sc.D.",
                           "description": "Doctor of Social Science",
                           "degree_id": 7,
                           "auto_approve": 1
                       },
                       {
                           "name": "Th.D.",
                           "description": "Doctor of Theology",
                           "degree_id": 7,
                           "auto_approve": 1
                       },
                       {
                           "name": "A.M.",
                           "description": "Master of Arts",
                           "degree_id": 5,
                           "auto_approve": 1
                       },
                       {
                           "name": "A.M.T.",
                           "description": "Master of Arts in Teaching",
                           "degree_id": 5,
                           "auto_approve": 1
                       },
                       {
                           "name": "Litt.M.",
                           "description": "Master of Letters",
                           "degree_id": 5,
                           "auto_approve": 1
                       },
                       {
                           "name": "LL.M.",
                           "description": "Master of Laws",
                           "degree_id": 5,
                           "auto_approve": 1
                       },
                       {
                           "name": "M.A.",
                           "description": "Master of Arts",
                           "degree_id": 5,
                           "auto_approve": 1
                       },
                       {
                           "name": "M.Aero.E.",
                           "description": "Master of Aeronautical Engineering",
                           "degree_id": 5,
                           "auto_approve": 1
                       },
                       {
                           "name": "M.B.A.",
                           "description": "Master of Business Administration",
                           "degree_id": 5,
                           "auto_approve": 1
                       },
                       {
                           "name": "M.C.S.",
                           "description": "Master of Computer Science",
                           "degree_id": 5,
                           "auto_approve": 1
                       },
                       {
                           "name": "M.Div.",
                           "description": "Master of Divinity",
                           "degree_id": 5,
                           "auto_approve": 1
                       },
                       {
                           "name": "M.E.",
                           "description": "Master of Engineering",
                           "degree_id": 5,
                           "auto_approve": 1
                       },
                       {
                           "name": "M.Ed.",
                           "description": "Master of Education",
                           "degree_id": 5,
                           "auto_approve": 1
                       },
                       {
                           "name": "M.Eng.",
                           "description": "Master of Engineering",
                           "degree_id": 5,
                           "auto_approve": 1
                       },
                       {
                           "name": "M.F.A.",
                           "description": "Master of Fine Arts",
                           "degree_id": 5,
                           "auto_approve": 1
                       },
                       {
                           "name": "M.H.A.",
                           "description": "Master of Hospital Administration",
                           "degree_id": 5,
                           "auto_approve": 1
                       },
                       {
                           "name": "M.L.S.",
                           "description": "Master of Library Science",
                           "degree_id": 5,
                           "auto_approve": 1
                       },
                       {
                           "name": "M.Mus.",
                           "description": "Master of Music",
                           "degree_id": 5,
                           "auto_approve": 1
                       },
                       {
                           "name": "M.N.",
                           "description": "Master of Nursing",
                           "degree_id": 5,
                           "auto_approve": 1
                       },
                       {
                           "name": "M.P.A.",
                           "description": "Master of Public Administration",
                           "degree_id": 5,
                           "auto_approve": 1
                       },
                       {
                           "name": "M.S.",
                           "description": "Master of Science",
                           "degree_id": 5,
                           "auto_approve": 1
                       },
                       {
                           "name": "M.S.Ed.",
                           "description": "Master of Science in Education",
                           "degree_id": 5,
                           "auto_approve": 1
                       },
                       {
                           "name": "M.S.W.",
                           "description": "Master of Social Work",
                           "degree_id": 5,
                           "auto_approve": 1
                       },
                       {
                           "name": "M.Th.",
                           "description": "Master of Theology",
                           "degree_id": 5,
                           "auto_approve": 1
                       },
                       {
                           "name": "Th.M.",
                           "description": "Master of Theology",
                           "degree_id": 5,
                           "auto_approve": 1
                       },
                       {
                           "name": "Ed.S.",
                           "description": "Education Specialist",
                           "degree_id": 6,
                           "auto_approve": 1
                       },
                       {
                           "name": "C.E.",
                           "description": "Civil Engineer",
                           "degree_id": 8,
                           "auto_approve": 1
                       },
                       {
                           "name": "Ch.E.",
                           "description": "Chemical Engineer",
                           "degree_id": 8,
                           "auto_approve": 1
                       },
                       {
                           "name": "E.E.",
                           "description": "Electrical Engineer",
                           "degree_id": 8,
                           "auto_approve": 1
                       },
                       {
                           "name": "E.M.",
                           "description": "Engineer of Mines",
                           "degree_id": 8,
                           "auto_approve": 1
                       },
                       {
                           "name": "E.Met.",
                           "description": "Engineer of Metallurgy",
                           "degree_id": 8,
                           "auto_approve": 1
                       },
                       {
                           "name": "I.E.",
                           "description": "Industrial Engineer or Industrial Engineering",
                           "degree_id": 8,
                           "auto_approve": 1
                       },
                       {
                           "name": "Nuc.E.",
                           "description": "Nuclear Engineer",
                           "degree_id": 8,
                           "auto_approve": 1
                       },
                       {
                           "name": "CAP",
                           "description": "UNM Hospitals Clinical Advancement Program",
                           "degree_id": 1,
                           "auto_approve": 0
                       }
                   ]
credentials.each do |credential|
  Credential.find_or_create_by(credential)
end
