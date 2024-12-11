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
        public string termination { get { return termination_date.ToString("yyyy-MM-dd") != "0001-01-01" ? termination_date.ToString("yyyy-MM-dd") : "Not terminated"; } }
        public string name { get; set; }
        public string brand { get; set; }
        public double monthly_fee { get; set; }
        public string total { get { return Math.Round((termination_date - rented_from).TotalDays / 30 * (monthly_fee), 2).ToString() + "kr"; } }

        public Rental() { }
        public Rental(int student_id, int instrument_id)
        {
            this.student_id = student_id;
            this.instrument_id = instrument_id;
            this.rented_from = DateTime.Now;
            this.rented_until = DateTime.Now.AddMonths(12);
        }
        public Rental(int id, int student_id, int instrument_id,
            DateTime rented_from, DateTime rented_until, DateTime termination_date,
            string name, string brand, double monthly_fee)
        {
            this.id = id;
            this.student_id = student_id;
            this.instrument_id = instrument_id;
            this.rented_from = rented_from;
            this.rented_until = rented_until;
            this.termination_date = termination_date;
            this.name = name;
            this.brand = brand;
            this.monthly_fee = monthly_fee;
        }

    }
}
