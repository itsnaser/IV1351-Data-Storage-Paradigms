using Soundgood.Core.Models;

namespace Soundgood.Core.NewFolder
{
    public class SqlQueries
    {
        public static string GetAvailableInstruments = @"SELECT * FROM soundgood.instrument i
                                                        WHERE i.id NOT IN(
                                                        SELECT instrument_id FROM soundgood.rental_period 
                                                        WHERE termination_date IS NULL);";
        public static string GetStudentActiveRentals(int student_id)
        {
            return @$"SELECT rp.id, rp.student_id, rp.instrument_id, rp.rented_from, 
                    rp.rented_until, rp.termination_date, it.name, i.brand, i.monthly_fee
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
                    WHERE student_id = {student_id} AND termination_date IS NOT NULL;";
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
                    VALUES ({rental.student_id}, {rental.instrument_id}, '{rental.rented_from}', '{rental.rented_from.AddMonths(12)}', NULL);";
        }
    }
}
