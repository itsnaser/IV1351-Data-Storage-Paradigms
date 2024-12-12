using Soundgood.Core.Models;

namespace Soundgood.Core.Services
{
    public interface IDataAccessLayer
    {
        IEnumerable<dynamic> ReadAllStudents();
        IEnumerable<dynamic> ReadAllPersons();
        dynamic ReadStudent(int student_id);
        dynamic ReadPerson(int person_id);
        IEnumerable<dynamic> ReadStudentActiveRentals(int student_id);
        IEnumerable<dynamic> ReadStudentHistoryRentals(int student_id);
        IEnumerable<dynamic> ReadAllInstruments();
        IEnumerable<dynamic> ReadAllInstrumentTypes();
        IEnumerable<dynamic> ReadAllAvailableInstruments();
        bool UpdateTerminatedRental(int rental_id);
        bool CreateNewRental(Rental rental);


    }
}
