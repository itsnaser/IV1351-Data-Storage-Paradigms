using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Soundgood.Core.Models;

namespace Soundgood.Core.Services
{
    public interface IDataAccessLayer
    {
        List<Student> GetStudents();
        Student GetStudent(int student_id);
        List<Rental> GetStudentActiveRentals(int student_id);
        List<Instrument> GetInstruments();
        List<Instrument> GetAvailableInstruments();
        bool TerminateRental(int rental_id);


    }
}
