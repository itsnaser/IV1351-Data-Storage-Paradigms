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

        public IEnumerable<dynamic> ReadAllStudents()
        {
            using var dataSource = NpgsqlDataSource.Create(_connectionString);
            using var connection = dataSource.OpenConnection();
            return connection.Query(SqlQueries.GetStudents());
        }

        public IEnumerable<dynamic> ReadAllPersons()
        {
            using var dataSource = NpgsqlDataSource.Create(_connectionString);
            using var connection = dataSource.OpenConnection();
            return connection.Query(SqlQueries.GetPersons());
        }

        public dynamic ReadStudent(int student_id)
        {
            using var dataSource = NpgsqlDataSource.Create(_connectionString);
            using var connection = dataSource.OpenConnection();
            return connection.QuerySingle(SqlQueries.GetStudent(student_id));

        }
        public dynamic ReadPerson(int person_id)
        {
            using var dataSource = NpgsqlDataSource.Create(_connectionString);
            using var connection = dataSource.OpenConnection();
            return connection.QuerySingle(SqlQueries.GetPerson(person_id));
        }

        public IEnumerable<dynamic> ReadStudentActiveRentals(int student_id)
        {
            using var dataSource = NpgsqlDataSource.Create(_connectionString);
            using var connection = dataSource.OpenConnection();
            return connection.Query(SqlQueries.GetStudentActiveRentals(student_id));
        }

        public IEnumerable<dynamic> ReadStudentHistoryRentals(int student_id)
        {
            using var dataSource = NpgsqlDataSource.Create(_connectionString);
            using var connection = dataSource.OpenConnection();
            return connection.Query(SqlQueries.GetStudentHistoryRentals(student_id));
        }

        public IEnumerable<dynamic> ReadAllInstruments()
        {
            using var dataSource = NpgsqlDataSource.Create(_connectionString);
            using var connection = dataSource.OpenConnection();
            return connection.Query(SqlQueries.GetInstruments());
        }

        public IEnumerable<dynamic> ReadAllInstrumentTypes()
        {
            using var dataSource = NpgsqlDataSource.Create(_connectionString);
            using var connection = dataSource.OpenConnection();
            return connection.Query(SqlQueries.GetInstrumentTypes());
        }

        public IEnumerable<dynamic> ReadAllAvailableInstruments()
        {
            using var dataSource = NpgsqlDataSource.Create(_connectionString);
            using var connection = dataSource.OpenConnection();
            return connection.Query(SqlQueries.GetAvailableInstruments());
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
            catch (Exception e)
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
            catch (Exception e)
            {
                transaction.Rollback();
                return false;
                throw;
            }
        }
    }
}
