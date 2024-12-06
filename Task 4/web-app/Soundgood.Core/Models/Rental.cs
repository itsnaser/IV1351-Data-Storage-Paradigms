using Dapper.Contrib.Extensions;

namespace Soundgood.Core.Models
{
    public class Rental
    {
        public int id { get; set; }
        public int student_id { get; set; }
        public int instrument_id { get; set; }
        public DateTime rented_from { get; set; }
        public DateTime rented_until { get; set; }
        public DateTime termination_date { get; set; }
        public string name { get; set; }
        public string brand { get; set; }
        public double monthly_fee { get; set; }




    }
}
