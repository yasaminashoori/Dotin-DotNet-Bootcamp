namespace Models.Personel
{
    /// <summary>
    /// کلاسی برای موجودیت اشخاص
    /// </summary>
    public class Person
    {
        private string _firstName;
        private string _lastName;

        public string FirstName
        {
            get
            {
                return _firstName;
            }
            set
            {
                _firstName = value;
            }
        }

        public string LastName
        {
            get
            {
                return _lastName;
            }
            set
            {
                if (value.Length < 3)
                    _lastName = "DEFAULT_NAME";
                _lastName = value;
            }
        }

        public bool Gender{ get; set;}

    }
}
