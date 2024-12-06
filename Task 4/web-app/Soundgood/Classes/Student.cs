using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace Soundgood.Classes
{
    [Table("student",Schema ="soundgood")] 
    public class Student
    {
        [Key]
        public int id { get; set; }
        public int perons_id { get; set; }
    }
}
