﻿using Dapper.Contrib.Extensions;

namespace Soundgood.Core.Models
{
    [Table("soundgood.instrument")]
    public class Instrument : IEquatable<Instrument>
    {
        [Key]
        public int id { get; set; }
        public string brand { get; set; }
        public double monthly_fee { get; set; }
        public int type_id { get; set; }

        [Computed]
        public InstrumentType type { get; set; }

        public Instrument()
        {
        }
        public Instrument(int id, string brand, double monthly_fee, int type_id)
        {
            this.id = id;
            this.brand = brand;
            this.monthly_fee = monthly_fee;
            this.type_id = type_id;
        }

        public bool Equals(Instrument other)
        {
            if (other == null) return false;
            return this.id == other.id;
        }
    }
}