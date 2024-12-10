namespace Soundgood.Core.Models
{
    public class InstrumentType : IEquatable<InstrumentType>
    {
        public int id { get; set; }
        public string name { get; set; }

        public InstrumentType() { }
        public InstrumentType(int? id, string name)
        {
            this.id = id is null ? -1 : id.Value;
            this.name = name;
        }
        public bool Equals(InstrumentType other)
        {
            if (other == null) return false;
            return this.id == other.id;
        }
    }
}
