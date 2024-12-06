using Dapper.Contrib.Extensions;

namespace Soundgood.Core.Models
{
    [Table("soundgood.instructor")]

    public class Instructor : IEquatable<Instructor>
    {
        [Key]
        public int id { get; set; }
        public int person_id { get; set; }
        public bool can_teach_ensemble { get; set; }

        [Computed]
        public Person person { get; set; }

        public Instructor()
        {
        }
        public Instructor(int id, int person_id, bool can_teach_ensemble)
        {
            this.id = id;
            this.person_id = person_id;
            this.can_teach_ensemble = can_teach_ensemble;
        }
        public bool Equals(Instructor other)
        {
            if (other == null) return false;
            return this.id == other.id;
        }

    }
}
