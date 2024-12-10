using Soundgood.Core.Models;

namespace Soundgood.Core.Constants
{
    public class SqlQueries
    {
        public static string GetStudents() { return @"SELECT * FROM soundgood.student;"; }
        public static string GetStudent(int student_id) { return @$"SELECT * FROM soundgood.student WHERE id = {student_id};"; }
        public static string GetPersons() { return @"SELECT * FROM soundgood.person;"; }
        public static string GetPerson(int person_id) { return @$"SELECT * FROM soundgood.person WHERE id = {person_id};"; }

        public static string GetInstruments() { return @"SELECT * FROM soundgood.instrument;"; }

        public static string GetInstrumentTypes() { return @"SELECT * FROM soundgood.instrument_type;"; }

        public static string GetAvailableInstruments()
        {
            return @"SELECT * FROM soundgood.instrument i
                    WHERE i.id NOT IN(
                    SELECT instrument_id FROM soundgood.rental_period 
                    WHERE termination_date IS NULL);";
        }
        public static string GetStudentActiveRentals(int student_id)
        {
            return @$"SELECT rp.id, rp.student_id, rp.instrument_id, rp.rented_from, 
                    rp.rented_until, COALESCE(rp.termination_date,'0001-01-01')  AS termination_date, it.name, i.brand, i.monthly_fee
                    FROM soundgood.rental_period rp 
                    LEFT JOIN soundgood.instrument i ON i.id = rp.instrument_id
                    LEFT JOIN soundgood.instrument_type it ON it.id = i.type_id
                    WHERE student_id = {student_id}
                    AND termination_date IS NULL;";
        }
        public static string GetStudentHistoryRentals(int student_id)
        {
            return @$"SELECT rp.id, rp.student_id, rp.instrument_id, rp.rented_from, 
                    rp.rented_until, rp.termination_date, it.name, i.brand, i.monthly_fee
                    FROM soundgood.rental_period rp 
                    LEFT JOIN soundgood.instrument i ON i.id = rp.instrument_id
                    LEFT JOIN soundgood.instrument_type it ON it.id = i.type_id
                    WHERE student_id = {student_id} AND termination_date IS NOT NULL
                    ORDER BY termination_date DESC;";
        }

        public static string TerminateRental(int rental_id)
        {
            return @$"UPDATE soundgood.rental_period 
                    SET termination_date = NOW()
                    WHERE id = {rental_id};";
        }
        public static string CreateNewRental(Rental rental)
        {
            return @$"INSERT INTO soundgood.rental_period 
                    (student_id, instrument_id, rented_from, rented_until, termination_date)
                    VALUES ({rental.student_id}, {rental.instrument_id}, '{rental.rented_from}', 
                    '{rental.rented_from.AddMonths(12)}', NULL);";
        }
    }
}
