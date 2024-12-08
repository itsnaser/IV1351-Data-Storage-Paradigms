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
        [Computed]
        public string termination { get { return termination_date.ToString("yyyy-MM-dd") != "0001-01-01" ? termination_date.ToString("yyyy-MM-dd") : "Not terminated"; } }
        public string name { get; set; }
        public string brand { get; set; }
        public double monthly_fee { get; set; }

        [Computed]
        public string total { get { return Math.Round((termination_date - rented_from).TotalDays / 30 * monthly_fee, 2).ToString() + "kr"; } }

        public Rental() { }
        public Rental(int student_id, int instrument_id)
        {
            this.student_id = student_id;
            this.instrument_id = instrument_id;
            this.rented_from = DateTime.Now;
            this.rented_until = DateTime.Now.AddMonths(12);
        }

    }
}
