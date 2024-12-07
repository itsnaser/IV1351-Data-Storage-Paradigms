using Dapper.Contrib.Extensions;
using Microsoft.Extensions.Configuration;
using Soundgood.Core.Models;
using Npgsql;
using Dapper;
using Soundgood.Core.NewFolder;

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
        public List<Student> GetStudents()

        {
            using var dataSource = NpgsqlDataSource.Create(_connectionString);
            using var connection = dataSource.OpenConnection();
            var students = connection.GetAll<Student>();
            var persons = connection.GetAll<Person>();
            //return connection.GetAll<Student>().ToList().Select(s => { s.person = persons.FirstOrDefault(p => p.id == s.person_id); return s; }).ToList();

            foreach (var student in students)
            {
                student.person = persons.FirstOrDefault(p => p.id == student.person_id);
            }

            return students.ToList();
        }

        public Student GetStudent(int id)
        {
            using var dataSource = NpgsqlDataSource.Create(_connectionString);
            using var connection = dataSource.OpenConnection();
            var student = connection.Get<Student>(id);
            var person = connection.Get<Person>(student.person_id);
            student.person = person;
            return student;
        }
        public List<Rental> GetStudentActiveRentals(int student_id)
        {
            using var dataSource = NpgsqlDataSource.Create(_connectionString);
            using var connection = dataSource.OpenConnection();
            var rentals = connection.Query<Rental>(SqlQueries.GetStudentActiveRentals(student_id));
            return rentals.ToList();
        }
        public List<Rental> GetStudentHistoryRentals(int student_id)
        {
            using var dataSource = NpgsqlDataSource.Create(_connectionString);
            using var connection = dataSource.OpenConnection();
            var rentals = connection.Query<Rental>(SqlQueries.GetStudentHistoryRentals(student_id));
            return rentals.ToList();
        }
        public List<Instrument> GetInstruments()
        {
            using var dataSource = NpgsqlDataSource.Create(_connectionString);
            using var connection = dataSource.OpenConnection();
            var instruments = connection.GetAll<Instrument>();
            return instruments.ToList();
        }
        public List<Instrument> GetAvailableInstruments()
        {
            using var dataSource = NpgsqlDataSource.Create(_connectionString);
            using var connection = dataSource.OpenConnection();
            var instruments = connection.Query<Instrument>(SqlQueries.GetAvailableInstruments);
            var instrumentstype = connection.GetAll<InstrumentType>();
            foreach (var instrument in instruments)
            {
                instrument.type = instrumentstype.FirstOrDefault(p => p.id == instrument.type_id);
            }
            return instruments.ToList();
        }

        public bool TerminateRental(int rental_id)
        {
            using var dataSource = NpgsqlDataSource.Create(_connectionString);
            using var connection = dataSource.OpenConnection();

            using (var transaction = connection.BeginTransaction())
            {

                var affected = connection.Execute(SqlQueries.TerminateRental(rental_id), transaction: transaction);
                if (affected > 0)
                {
                    transaction.Commit();
                }
                else
                {
                    transaction.Rollback();
                    return false;
                }
                return true;
            }
        }

        public bool CreateNewRental(Rental rental)
        {
            using var dataSource = NpgsqlDataSource.Create(_connectionString);
            using var connection = dataSource.OpenConnection();

            using (var transaction = connection.BeginTransaction())
            {
                try
                {
                    var affected = connection.Execute(SqlQueries.CreateNewRental(rental), transaction: transaction);
                    if (affected > 0)
                    {
                        transaction.Commit();
                    }
                }
                catch (Exception)
                {
                    transaction.Rollback();
                    return false;
                    throw;
                }

                return true;
            }
        }

    }
}
