using Soundgood.Core.Models;

namespace Soundgood.Core.Services
{
    public class SoundgoodLogic : ISoundgoodLogic

    {
        private readonly IDataAccessLayer _DAL;

        public SoundgoodLogic(IDataAccessLayer dal)
        {
            _DAL = dal;
        }
        public List<Instrument> GetAllAvailableInstruments()
        {
            return _DAL.ReadAllAvailableInstruments();
        }
        public List<Student> GetAllStudents()
        {
            return _DAL.ReadAllStudents();
        }
        public Student GetStudent(int student_id)
        {
            return _DAL.ReadStudent(student_id);
        }
        public List<Rental> GetStudentActiveRentals(int student_id)
        {
            return _DAL.ReadStudentActiveRentals(student_id);
        }
        public List<Rental> GetStudentHistoryRentals(int student_id)
        {
            return _DAL.ReadStudentHistoryRentals(student_id);
        }
        public List<Instrument> GetAllInstruments()
        {
            return _DAL.ReadAllInstruments();
        }
        public bool ModifyTerminatedRental(int rental_id)
        {
            return _DAL.UpdateTerminatedRental(rental_id);
        }
        public bool AddNewRental(int student_id, int instrument_id)
        {
            Rental rental = new Rental(student_id, instrument_id);
            return _DAL.CreateNewRental(rental);
        }
    }
}
