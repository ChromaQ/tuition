# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Generate a list of degree programs - no duplicates made if rake db:seed is rerun.
degrees = [{name: 'Other'}, {name: 'Certificate'}, {name: 'Associate'}, {name: 'Bachelor'}, {name: 'Master'}, {name: 'Doctorate'}, {name: 'Engineering'}]

degrees.each do |degree|
  Degree.find_or_create_by(degree)
end

# Generate a list of credentials - no duplicates made if rake db:seed is rerun.
credentials = [
                       {
                           "name": "A.A.",
                           "description": "Associate of Arts",
                           "degree_id": 3,
                           "auto_approve": false
                       },
                       {
                           "name": "A.S.",
                           "description": "Associate of Science",
                           "degree_id": 3,
                           "auto_approve": true
                       },
                       {
                           "name": "A.A.A.",
                           "description": "Associate of Applied Arts",
                           "degree_id": 3,
                           "auto_approve": false
                       },
                       {
                           "name": "A.A.S.",
                           "description": "Associate of Applied Science",
                           "degree_id": 3,
                           "auto_approve": true
                       },
                       {
                           "name": "A.D.N.",
                           "description": "Associate in Nursing",
                           "degree_id": 3,
                           "auto_approve": true
                       },
                       {
                           "name": "B.A.",
                           "description": "Bachelor of Arts",
                           "degree_id": 4,
                           "auto_approve": false
                       },
                       {
                           "name": "B.A.M.",
                           "description": "Bachelor of Applied Mathematics",
                           "degree_id": 4,
                           "auto_approve": true
                       },
                       {
                           "name": "B.Arch.",
                           "description": "Bachelor of Architecture",
                           "degree_id": 4,
                           "auto_approve": false
                       },
                       {
                           "name": "B.B.A.",
                           "description": "Bachelor of Business Administration",
                           "degree_id": 4,
                           "auto_approve": true
                       },
                       {
                           "name": "B.C.E.",
                           "description": "Bachelor of Civil Engineering",
                           "degree_id": 4,
                           "auto_approve": true
                       },
                       {
                           "name": "B.Ch.E.",
                           "description": "Bachelor of Chemical Engineering",
                           "degree_id": 4,
                           "auto_approve": true
                       },
                       {
                           "name": "B.E.D.",
                           "description": "Bachelor of Education",
                           "degree_id": 4,
                           "auto_approve": true
                       },
                       {
                           "name": "B.E.E.",
                           "description": "Bachelor of Electrical Engineering",
                           "degree_id": 4,
                           "auto_approve": true
                       },
                       {
                           "name": "B.F.A.",
                           "description": "Bachelor of Fine Arts",
                           "degree_id": 4,
                           "auto_approve": false
                       },
                       {
                           "name": "B.J.",
                           "description": "Bachelor of Journalism",
                           "degree_id": 4,
                           "auto_approve": true
                       },
                       {
                           "name": "B.Lit.",
                           "description": "Bachelor of Literature",
                           "degree_id": 4,
                           "auto_approve": false
                       },
                       {
                           "name": "B.M.",
                           "description": "Bachelor of Music",
                           "degree_id": 4,
                           "auto_approve": false
                       },
                       {
                           "name": "B.M.S.",
                           "description": "Bachelor of Marine Science",
                           "degree_id": 4,
                           "auto_approve": false
                       },
                       {
                           "name": "B.N.",
                           "description": "Bachelor of Nursing",
                           "degree_id": 4,
                           "auto_approve": true
                       },
                       {
                           "name": "B.Pharm.",
                           "description": "Bachelor of Pharmacy",
                           "degree_id": 4,
                           "auto_approve": true
                       },
                       {
                           "name": "B.S. or S.B.",
                           "description": "Bachelor of Science",
                           "degree_id": 4,
                           "auto_approve": false
                       },
                       {
                           "name": "B.S.B.A.",
                           "description": "Bachelor of Science in Business Administration",
                           "degree_id": 4,
                           "auto_approve": true
                       },
                       {
                           "name": "B.S.Ed.",
                           "description": "Bachelor of Science in Education",
                           "degree_id": 4,
                           "auto_approve": true
                       },
                       {
                           "name": "B.S.E.E.",
                           "description": "Bachelor of Science in Electrical Engineering",
                           "degree_id": 4,
                           "auto_approve": true
                       },
                       {
                           "name": "B.S.N.",
                           "description": "Bachelor of Science in Nursing",
                           "degree_id": 4,
                           "auto_approve": true
                       },
                       {
                           "name": "B.S.P.",
                           "description": "Bachelor of Professional Studies",
                           "degree_id": 4,
                           "auto_approve": false
                       },
                       {
                           "name": "Litt.B.",
                           "description": "Bachelor of Letters",
                           "degree_id": 4,
                           "auto_approve": false
                       },
                       {
                           "name": "LL.B.",
                           "description": "Bachelor of Laws",
                           "degree_id": 4,
                           "auto_approve": true
                       },
                       {
                           "name": "Ph.B.",
                           "description": "Bachelor of Philosophy",
                           "degree_id": 4,
                           "auto_approve": false
                       },
                       {
                           "name": "Th.B.",
                           "description": "Bachelor of Theology",
                           "degree_id": 4,
                           "auto_approve": false
                       },
                       {
                           "name": "D.A.",
                           "description": "Doctor of Arts",
                           "degree_id": 6,
                           "auto_approve": false
                       },
                       {
                           "name": "D.A.S.",
                           "description": "Doctor of Applied Science",
                           "degree_id": 6,
                           "auto_approve": true
                       },
                       {
                           "name": "D.B.A.",
                           "description": "Doctor of Business Administration",
                           "degree_id": 6,
                           "auto_approve": true
                       },
                       {
                           "name": "D.C.",
                           "description": "Doctor of Chiropractic",
                           "degree_id": 6,
                           "auto_approve": true
                       },
                       {
                           "name": "D.D.",
                           "description": "Doctor of Divinity",
                           "degree_id": 6,
                           "auto_approve": false
                       },
                       {
                           "name": "D.Ed.",
                           "description": "Doctor of Education",
                           "degree_id": 6,
                           "auto_approve": true
                       },
                       {
                           "name": "D.L.S.",
                           "description": "Doctor of Library Science",
                           "degree_id": 6,
                           "auto_approve": false
                       },
                       {
                           "name": "D.M.D.",
                           "description": "Doctor of Dental Medicine",
                           "degree_id": 6,
                           "auto_approve": true
                       },
                       {
                           "name": "D.M.S.",
                           "description": "Doctor of Medical Science",
                           "degree_id": 6,
                           "auto_approve": true
                       },
                       {
                           "name": "D.P.A.",
                           "description": "Doctor of Public Administration",
                           "degree_id": 6,
                           "auto_approve": true
                       },
                       {
                           "name": "D.P.H.",
                           "description": "Doctor of Public Health",
                           "degree_id": 6,
                           "auto_approve": true
                       },
                       {
                           "name": "D.R.E.",
                           "description": "Doctor of Religious Education",
                           "degree_id": 6,
                           "auto_approve": false
                       },
                       {
                           "name": "D.S.W.",
                           "description": "Doctor of Social Welfare or Doctor of Social Work",
                           "degree_id": 6,
                           "auto_approve": true
                       },
                       {
                           "name": "D.Sc.",
                           "description": "Doctor of Science",
                           "degree_id": 6,
                           "auto_approve": true
                       },
                       {
                           "name": "D.V.M.",
                           "description": "Doctor of Veterinary Medicine",
                           "degree_id": 6,
                           "auto_approve": false
                       },
                       {
                           "name": "Ed.D.",
                           "description": "Doctor of Education",
                           "degree_id": 6,
                           "auto_approve": true
                       },
                       {
                           "name": "J.D. or LL.D.",
                           "description": "Doctor of Laws",
                           "degree_id": 6,
                           "auto_approve": true
                       },
                       {
                           "name": "J.S.D.",
                           "description": "Doctor of Juristic Science",
                           "degree_id": 6,
                           "auto_approve": true
                       },
                       {
                           "name": "L.H.D.",
                           "description": "Doctor of Humane Letters",
                           "degree_id": 6,
                           "auto_approve": false
                       },
                       {
                           "name": "M.D.",
                           "description": "Doctor of Medicine",
                           "degree_id": 6,
                           "auto_approve": true
                       },
                       {
                           "name": "O.D.",
                           "description": "Doctor of Optometry",
                           "degree_id": 6,
                           "auto_approve": true
                       },
                       {
                           "name": "Pharm.D.",
                           "description": "Doctor of Pharmacy",
                           "degree_id": 6,
                           "auto_approve": true
                       },
                       {
                           "name": "Ph.D.",
                           "description": "Doctor of Philosophy",
                           "degree_id": 6,
                           "auto_approve": true
                       },
                       {
                           "name": "Sc.D.",
                           "description": "Doctor of Science",
                           "degree_id": 6,
                           "auto_approve": true
                       },
                       {
                           "name": "S.J.D.",
                           "description": "Doctor of Juridical Science or Doctor of the Science of Law",
                           "degree_id": 6,
                           "auto_approve": true
                       },
                       {
                           "name": "S.Sc.D.",
                           "description": "Doctor of Social Science",
                           "degree_id": 6,
                           "auto_approve": true
                       },
                       {
                           "name": "Th.D.",
                           "description": "Doctor of Theology",
                           "degree_id": 6,
                           "auto_approve": false
                       },
                       {
                           "name": "A.M.T.",
                           "description": "Master of Arts in Teaching",
                           "degree_id": 5,
                           "auto_approve": true
                       },
                       {
                           "name": "Litt.M.",
                           "description": "Master of Letters",
                           "degree_id": 5,
                           "auto_approve": false
                       },
                       {
                           "name": "LL.M.",
                           "description": "Master of Laws",
                           "degree_id": 5,
                           "auto_approve": true
                       },
                       {
                           "name": "M.A.",
                           "description": "Master of Arts",
                           "degree_id": 5,
                           "auto_approve": false
                       },
                       {
                           "name": "M.Aero.E.",
                           "description": "Master of Aeronautical Engineering",
                           "degree_id": 5,
                           "auto_approve": false
                       },
                       {
                           "name": "M.B.A.",
                           "description": "Master of Business Administration",
                           "degree_id": 5,
                           "auto_approve": true
                       },
                       {
                           "name": "M.C.S.",
                           "description": "Master of Computer Science",
                           "degree_id": 5,
                           "auto_approve": true
                       },
                       {
                           "name": "M.Div.",
                           "description": "Master of Divinity",
                           "degree_id": 5,
                           "auto_approve": false
                       },
                       {
                           "name": "M.E.",
                           "description": "Master of Engineering",
                           "degree_id": 5,
                           "auto_approve": true
                       },
                       {
                           "name": "M.Ed.",
                           "description": "Master of Education",
                           "degree_id": 5,
                           "auto_approve": true
                       },
                       {
                           "name": "M.Eng.",
                           "description": "Master of Engineering",
                           "degree_id": 5,
                           "auto_approve": true
                       },
                       {
                           "name": "M.F.A.",
                           "description": "Master of Fine Arts",
                           "degree_id": 5,
                           "auto_approve": false
                       },
                       {
                           "name": "M.H.A.",
                           "description": "Master of Hospital Administration",
                           "degree_id": 5,
                           "auto_approve": true
                       },
                       {
                           "name": "M.L.S.",
                           "description": "Master of Library Science",
                           "degree_id": 5,
                           "auto_approve": false
                       },
                       {
                           "name": "M.Mus.",
                           "description": "Master of Music",
                           "degree_id": 5,
                           "auto_approve": false
                       },
                       {
                           "name": "M.N.",
                           "description": "Master of Nursing",
                           "degree_id": 5,
                           "auto_approve": true
                       },
                       {
                           "name": "M.P.A.",
                           "description": "Master of Public Administration",
                           "degree_id": 5,
                           "auto_approve": true
                       },
                       {
                           "name": "M.S.",
                           "description": "Master of Science",
                           "degree_id": 5,
                           "auto_approve": true
                       },
                       {
                           "name": "M.S.Ed.",
                           "description": "Master of Science in Education",
                           "degree_id": 5,
                           "auto_approve": true
                       },
                       {
                           "name": "M.S.W.",
                           "description": "Master of Social Work",
                           "degree_id": 5,
                           "auto_approve": true
                       },
                       {
                           "name": "M.Th. or Th.M.",
                           "description": "Master of Theology",
                           "degree_id": 5,
                           "auto_approve": false
                       },
                       {
                           "name": "C.E.",
                           "description": "Civil Engineer",
                           "degree_id": 7,
                           "auto_approve": true
                       },
                       {
                           "name": "Ch.E.",
                           "description": "Chemical Engineer",
                           "degree_id": 7,
                           "auto_approve": true
                       },
                       {
                           "name": "E.E.",
                           "description": "Electrical Engineer",
                           "degree_id": 7,
                           "auto_approve": true
                       },
                       {
                           "name": "E.M.",
                           "description": "Engineer of Mines",
                           "degree_id": 7,
                           "auto_approve": false
                       },
                       {
                           "name": "E.Met.",
                           "description": "Engineer of Metallurgy",
                           "degree_id": 7,
                           "auto_approve": false
                       },
                       {
                           "name": "I.E.",
                           "description": "Industrial Engineer or Industrial Engineering",
                           "degree_id": 7,
                           "auto_approve": false
                       },
                       {
                           "name": "Nuc.E.",
                           "description": "Nuclear Engineer",
                           "degree_id": 7,
                           "auto_approve": false
                       },
                       {
                           "name": "CAP",
                           "description": "UNM Hospitals Clinical Advancement Program",
                           "degree_id": 1,
                           "auto_approve": false
                       },
                       {
                         "name": "Undergrad Certificate",
                         "description": "For-Credit Undergraduate Certificate Program",
                         "degree_id": 2,
                         "auto_approve": false
                       },
                       {
                         "name": "Post-Baccalaureate Certificate",
                         "description": "For-Credit Post-Baccalaureate Certificate Program",
                         "degree_id": 2,
                         "auto_approve": false
                       },
                       {
                         "name": "Post-Master's Certificate",
                         "description": "For-Credit Post-Master's Certificate Program",
                         "degree_id": 2,
                         "auto_approve": false
                       },
                       {
                         "name": "Ed.S.",
                         "description": "Education Specialist",
                         "degree_id": 2,
                         "auto_approve": true
                       },
                   ]
credentials.each do |credential|
  Credential.find_or_create_by(credential)
end

schools = [
  {
     "name": "Western Governors University",
     "aka": "WGU  Western Governors",
     "city": "Salt Lake City",
     "state": "UT",
     "operating": true,
     "unitid": 433387,
     "opeid": "03339400"
   },
   {
     "name": "Southern New Hampshire University",
     "aka": "SNHU",
     "city": "Manchester",
     "state": "NH",
     "operating": true,
     "unitid": 183026,
     "opeid": "00258000"
   },
  {
    "name": "University of New Mexico-Main Campus",
    "aka": "UNM",
    "city": "Albuquerque",
    "state": "NM",
    "operating": true,
    "unitid": 187985,
    "opeid": "00266300"
  },
  {
    "name": "University of New Mexico-Gallup Campus",
    "aka": "UNM-Gallup",
    "city": "Gallup",
    "state": "NM",
    "operating": true,
    "unitid": 187958,
    "opeid": "00266301"
  },
  {
    "name": "University of New Mexico-Valencia County Campus",
    "aka": "UNM - Valencia",
    "city": "Los Lunas",
    "state": "NM",
    "operating": true,
    "unitid": 188049,
    "opeid": "00266302"
  },
  {
    "name": "University of New Mexico-Los Alamos Campus",
    "aka": "UNM - Los Alamos",
    "city": "Los Alamos",
    "state": "NM",
    "operating": true,
    "unitid": 187976,
    "opeid": "00266303"
  },
  {
    "name": "University of New Mexico-Taos Campus",
    "aka": "UNM - Taos",
    "city": "Ranchos de Taos",
    "state": "NM",
    "operating": true,
    "unitid": 188225,
    "opeid": "00266304"
  },
  {
    "name": "Grand Canyon University",
    "aka": "GCU",
    "city": "Phoenix",
    "state": "AZ",
    "operating": true,
    "unitid": 104717,
    "opeid": "00107400"
  }
]
schools.each do |school|
  School.find_or_create_by(school)
end
