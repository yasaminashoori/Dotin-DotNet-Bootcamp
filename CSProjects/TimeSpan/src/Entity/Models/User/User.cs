using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.User
{
    /// <summary>
    /// کلاسی برای گرفتن اطلاعات شخصی کاربر
    /// </summary>
    public class User
    {
        public User()
        {
        }

        public User(string FirstName, string LastName, DateTime BirthDate)
        {
            _firstName = FirstName;
            _lastName = LastName;
            _birthDate = BirthDate;
        }

        private string _firstName;
        private string _lastName;
        private DateTime _birthDate;

        public string FirstName
        {
            get { return _firstName; }
            set { _firstName = value; }
        }

        public string LastName
        {
            get { return _lastName; }
            set { _lastName = value; }
        }

        public DateTime BirthDate
        {
            get { return _birthDate; }
            set { _birthDate = value; }
        }

        public TimeSpan UserCompareTime(User otherUser)
        {
            TimeSpan timeDifference = this._birthDate - otherUser._birthDate;
            Console.Write("The difference of the user BirthDate is: ");
            return timeDifference;
        }

        public override string ToString()
        {
            return $"{FirstName} {LastName}";
        }
    }
}
