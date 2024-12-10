using Microsoft.Extensions.Configuration;
using Soundgood.Core.Models;
using Npgsql;
using Dapper;
using Soundgood.Core.Constants;

namespace Soundgood.Core.Services
{
    public class DataAccessLayer : IDataAccessLayer
    {
        private IConfiguration _config;
        private static string? _connectionString { get; set; }
        public DataAccessLayer(IConfiguration config)
        {
            _config = config;
            _connectionString = _config.GetConnectionString("Soundgood");
        }

        public List<Student> ReadAllStudents()

        {
            List<Student> students = new List<Student>();
            using var dataSource = NpgsqlDataSource.Create(_connectionString);
            using var connection = dataSource.OpenConnection();
            var studentsTable = connection.Query(SqlQueries.GetStudents());
            var personsTable = connection.Query(SqlQueries.GetPersons());
            foreach (var studentRow in studentsTable)
            {
                var student = new Student(studentRow.id,
                    studentRow.person_id);
                var personRow = personsTable.FirstOrDefault(p => p.id == studentRow.person_id);
                var person = new Person(personRow?.id,
                    personRow?.personal_no,
                    personRow?.first_name,
                    personRow?.last_name);

                student.person = person;
                students.Add(student);
            }
            return students;
        }

        public Student ReadStudent(int id)
        {
            using var dataSource = NpgsqlDataSource.Create(_connectionString);
            using var connection = dataSource.OpenConnection();
            var studentRow = connection.QuerySingle(SqlQueries.GetStudent(id));
            var student = new Student(studentRow.id, studentRow.person_id);
            var personRow = connection.QuerySingle(SqlQueries.GetPerson(student.person_id));
            student.person = new Person(personRow.id,
                    personRow.personal_no,
                    personRow.first_name,
                    personRow.last_name);
            return student;
        }

        public List<Rental> ReadStudentActiveRentals(int student_id)
        {
            List<Rental> rentals = new List<Rental>();
            using var dataSource = NpgsqlDataSource.Create(_connectionString);
            using var connection = dataSource.OpenConnection();
            var rentalsTable = connection.Query(SqlQueries.GetStudentActiveRentals(student_id));
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

        public List<Rental> ReadStudentHistoryRentals(int student_id)
        {
            List<Rental> rentals = new List<Rental>();
            using var dataSource = NpgsqlDataSource.Create(_connectionString);
            using var connection = dataSource.OpenConnection();
            var rentalsTable = connection.Query(SqlQueries.GetStudentHistoryRentals(student_id));
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

        public List<Instrument> ReadAllInstruments()
        {
            List<Instrument> instruments = new List<Instrument>();
            using var dataSource = NpgsqlDataSource.Create(_connectionString);
            using var connection = dataSource.OpenConnection();
            var instrumentsTable = connection.Query(SqlQueries.GetInstruments());
            foreach (var instr in instrumentsTable)
            {
                instruments.Add(new Instrument(instr.id, instr.type_id, instr.brand, instr.monthly_fee));
            }
            return instruments;
        }

        public List<Instrument> ReadAllAvailableInstruments()
        {
            List<Instrument> instruments = new List<Instrument>();
            using var dataSource = NpgsqlDataSource.Create(_connectionString);
            using var connection = dataSource.OpenConnection();
            var instrumentsTable = connection.Query(SqlQueries.GetAvailableInstruments());
            var instrumentsTypeTable = connection.Query(SqlQueries.GetInstrumentTypes());
            foreach (var instrumentsRow in instrumentsTable)
            {
                var instrument = new Instrument(instrumentsRow.id,
                    instrumentsRow.brand,
                    (double)instrumentsRow.monthly_fee,
                    instrumentsRow.type_id);
                var instrumentsTypeRow = instrumentsTypeTable.FirstOrDefault(p => p.id == instrumentsRow.type_id);
                var instrumentType = new InstrumentType(instrumentsTypeRow?.id,
                    instrumentsTypeRow?.name);

                instrument.type = instrumentType;
                instruments.Add(instrument);
            }
            return instruments.ToList();
        }

        public bool UpdateTerminatedRental(int rental_id)
        {
            using var connection = new NpgsqlConnection(_connectionString);
            connection.Open();
            using var transaction = connection.BeginTransaction();

            try
            {
                using (var command = new NpgsqlCommand(SqlQueries.TerminateRental(rental_id), connection, transaction))
                {
                    command.ExecuteScalar();
                }
                transaction.Commit();
                return true;
            }
            catch (Exception)
            {
                transaction.Rollback();
                return false;
                throw;
            }
        }

        public bool CreateNewRental(Rental rental)
        {
            using var connection = new NpgsqlConnection(_connectionString);
            connection.Open();
            using var transaction = connection.BeginTransaction();

            try
            {
                using (var command = new NpgsqlCommand(SqlQueries.CreateNewRental(rental), connection, transaction))
                {
                    command.ExecuteScalar();
                }
                transaction.Commit();
                return true;
            }
            catch (Exception)
            {
                transaction.Rollback();
                return false;
            }
        }
    }
}
