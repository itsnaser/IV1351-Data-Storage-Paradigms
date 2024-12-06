using Dapper.Contrib.Extensions;

namespace Soundgood.Core.Models
{
    [Table("soundgood.person")]
    public class Person : IEquatable<Person>
    {
        [Key]
        public int id { get; set; }
        public string personal_no { get; set; }
        public string first_name{ get; set; }
        public string last_name { get; set; }
        [Computed]
        public string full_name { get { return first_name + " " + last_name; } }
        public Person()
        {
        }
        public Person(int id, string personal_no, string first_name, string last_name)
        {
            this.id = id;
            this.personal_no = personal_no;
            this.first_name = first_name;
            this.last_name = last_name;
        }
        public bool Equals(Person other)
        {
            return other != null && this.id == other.id;
        }

    }
}
