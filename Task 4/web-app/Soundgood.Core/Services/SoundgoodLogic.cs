using Soundgood.Core.Constants;
using Soundgood.Core.Models;

namespace Soundgood.Core.Services
{
    public class SoundgoodLogic : ISoundgoodLogic

    {
        private readonly IDataAccessLayer _DAL;

        public SoundgoodLogic(IDataAccessLayer dal)
        {
            _DAL = dal;
        }

        public List<Student> GetAllStudents()
        {
            List<Student> students = new List<Student>();
            var studentsTable = _DAL.ReadAllStudents();
            List<Person> persons = GetAllPersons();
            foreach (var studentRow in studentsTable)
            {
                var student = new Student(studentRow.id,
                    studentRow.person_id);
                var person = persons.FirstOrDefault(p => p.id == studentRow.person_id);
                student.person = person;
                students.Add(student);
            }
            return students;
        }

        public List<Person> GetAllPersons()
        {
            List<Person> persons = new List<Person>();
            var personsTable = _DAL.ReadAllPersons();
            foreach (var personRow in personsTable)
            {
                var person = new Person(personRow?.id,
                    personRow?.personal_no,
                    personRow?.first_name,
                    personRow?.last_name);

                persons.Add(person);
            }
            return persons;
        }

        public Student GetStudent(int student_id)
        {
            var studentRow = _DAL.ReadStudent(student_id);
            var student = new Student(studentRow.id, studentRow.person_id);
            student.person = GetPerson(student.person_id);
            return student;
        }

        public Person GetPerson(int person_id)
        {
            var personRow = _DAL.ReadPerson(person_id);
            Person person = new Person(personRow.id,
                    personRow.personal_no,
                    personRow.first_name,
                    personRow.last_name);
            return person;
        }

        public List<Rental> GetStudentActiveRentals(int student_id)
        {
            List<Rental> rentals = new List<Rental>();
            var rentalsTable = _DAL.ReadStudentActiveRentals(student_id);
            foreach (var rentalRow in rentalsTable)
            {
                rentals.Add(new Rental(rentalRow.id,
                    rentalRow.student_id,
                    rentalRow.instrument_id,
                    rentalRow.rented_from,
                    rentalRow.rented_until,
                    rentalRow.termination_date,
                    rentalRow.name,
                    rentalRow.brand,
                    (double)rentalRow.monthly_fee));
            }
            return rentals;
        }

        public List<Rental> GetStudentHistoryRentals(int student_id)
        {
            List<Rental> rentals = new List<Rental>();
            var rentalsTable = _DAL.ReadStudentHistoryRentals(student_id);
            foreach (var rentalRow in rentalsTable)
            {
                rentals.Add(new Rental(rentalRow.id,
                    rentalRow.student_id,
                    rentalRow.instrument_id,
                    rentalRow.rented_from,
                    rentalRow.rented_until,
                    rentalRow.termination_date,
                    rentalRow.name,
                    rentalRow.brand,
                    (double)rentalRow.monthly_fee));
            }
            return rentals;
        }

        public List<Instrument> GetAllInstruments()
        {
            List<Instrument> instruments = new List<Instrument>();
            var instrumentsTable = _DAL.ReadAllInstruments();
            foreach (var instrumentRow in instrumentsTable)
            {
                instruments.Add(new Instrument(instrumentRow.id, instrumentRow.type_id, instrumentRow.instrumentRow, instrumentRow.monthly_fee));
            }
            return instruments;
        }
        public List<InstrumentType> ReadAllInstrumentTypes()
        {
            List<InstrumentType> instrumentTypes = new List<InstrumentType>();
            var instrumentTypesTable = _DAL.ReadAllInstrumentTypes();
            foreach (var instrumentTypeRow in instrumentTypesTable)
            {
                instrumentTypes.Add(new InstrumentType(instrumentTypeRow.id, instrumentTypeRow.name));
            }
            return instrumentTypes;
        }
        public List<Instrument> GetAllAvailableInstruments()
        {
            List<Instrument> instruments = new List<Instrument>();
            var instrumentsTable = _DAL.ReadAllAvailableInstruments();
            List<InstrumentType> instrumentTypes = ReadAllInstrumentTypes();
            foreach (var instrumentsRow in instrumentsTable)
            {
                var instrument = new Instrument(instrumentsRow.id,
                    instrumentsRow.brand,
                    (double)instrumentsRow.monthly_fee,
                    instrumentsRow.type_id);
                instrument.type = instrumentTypes.FirstOrDefault(p => p.id == instrumentsRow.type_id);

                instruments.Add(instrument);
            }
            return instruments;
        }

        public bool ModifyTerminatedRental(int rental_id)
        {
            return _DAL.UpdateTerminatedRental(rental_id);
        }

        public bool AddNewRental(int student_id, int instrument_id)
        {
            Rental rental = new Rental(student_id, instrument_id);
            return _DAL.CreateNewRental(rental);
        }
    }
}
