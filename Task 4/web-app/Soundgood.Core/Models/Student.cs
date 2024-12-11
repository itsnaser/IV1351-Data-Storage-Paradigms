namespace Soundgood.Core.Models
{
    public class Student : IEquatable<Student>
    {
        public int id { get; set; }
        public int person_id { get; set; }
        public Person person { get; set; }

        public Student() { }
        public Student(int id, int person_id)
        {
            this.id = id;
            this.person_id = person_id;
        }
        public bool Equals(Student other)
        {
            if (other == null) return false;
            return this.id == other.id;
        }
    }
}
