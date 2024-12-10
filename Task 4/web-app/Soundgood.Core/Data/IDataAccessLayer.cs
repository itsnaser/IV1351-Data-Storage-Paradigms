using Soundgood.Core.Models;

namespace Soundgood.Core.Services
{
    public interface IDataAccessLayer
    {
        List<Student> ReadAllStudents();
        Student ReadStudent(int student_id);
        List<Rental> ReadStudentActiveRentals(int student_id);
        List<Rental> ReadStudentHistoryRentals(int student_id);
        List<Instrument> ReadAllInstruments();
        List<Instrument> ReadAllAvailableInstruments();
        bool UpdateTerminatedRental(int rental_id);
        bool CreateNewRental(Rental rental);


    }
}
