namespace Soundgood.Core.NewFolder
{
    public class SqlQueries
    {
        public static string GetAvailableInstruments = @"SELECT i.* FROM soundgood.instrument i
                                                        LEFT JOIN soundgood.rental_period rp ON i.id = rp.instrument_id 
                                                        AND rp.rented_until > NOW()
                                                        WHERE rp.instrument_id IS NULL
                                                        ORDER BY i.id;";
        public static string GetStudentActiveRentals(int student_id)
        {
            return @$"SELECT rp.id, rp.student_id, rp.instrument_id, rp.rented_from, 
                    rp.rented_until, rp.termination_date, it.name, i.brand, i.monthly_fee
                    FROM soundgood.rental_period rp 
                    LEFT JOIN soundgood.instrument i ON i.id = rp.instrument_id
                    LEFT JOIN soundgood.instrument_type it ON it.id = i.type_id
                    WHERE student_id = {student_id} AND rented_until > NOW() 
                    AND termination_date IS NULL;";
        }

        public static string TerminateRental(int rental_id)
        {
            return @$"UPDATE soundgood.rental_period 
                    SET termination_date = NOW()
                    WHERE id = {rental_id};";
        }
    }
}
