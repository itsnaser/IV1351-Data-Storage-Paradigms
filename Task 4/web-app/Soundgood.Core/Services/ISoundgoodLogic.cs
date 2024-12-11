using Soundgood.Core.Models;

namespace Soundgood.Core.Services
{
    public interface ISoundgoodLogic
    {
        List<Student> GetAllStudents();
        Student GetStudent(int student_id);
        List<Rental> GetStudentActiveRentals(int student_id);
        List<Rental> GetStudentHistoryRentals(int student_id);
        List<Instrument> GetAllInstruments();
        List<Instrument> GetAllAvailableInstruments();
        bool ModifyTerminatedRental(int rental_id);
        bool AddNewRental(int student_id, int instrument_id);
    }
}
