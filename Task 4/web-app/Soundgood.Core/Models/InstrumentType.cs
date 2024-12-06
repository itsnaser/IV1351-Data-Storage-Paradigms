using Dapper.Contrib.Extensions;

namespace Soundgood.Core.Models
{
    [Table("soundgood.instrument_type")]
    public class InstrumentType : IEquatable<InstrumentType>
    {
        [Key]
        public int id { get; set; }
        public string name { get; set; }
        public InstrumentType()
        {
        }

        public InstrumentType(int id, string name)
        {
            this.id = id;
            this.name = name;
        }

        public bool Equals(InstrumentType other)
        {
            if (other == null) return false;
            return this.id == other.id;
        }
    }
}
