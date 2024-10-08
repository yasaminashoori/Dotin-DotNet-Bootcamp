﻿using NH = NHibernate;
using Domain.Concrete.Base;
using Domain.Contract.Base;

namespace Application.Base
{
    public abstract class BaseRepository<T> : IBaseRepository<T> where T : BaseEntity
    {

        public readonly NH.ISession _session;


        public BaseRepository(NH.ISession session)
        {
            _session = session;
        }

        public void Add(T entity)
        {
            _session.Save(entity);
        }

        public void Delete(T entity)
        {
            _session.Delete(entity);
        }

        public void Edit(T entity)
        {
            _session.Update(entity);
        }

        public IQueryable<T> GetAll()
        {
            return _session.Query<T>();
        }

        public T Get(int id)
        {
            return _session.Get<T>(id);
        }

        public abstract bool IsEntityValidate(T entity);

        public void Insert(T entity)
        {
            throw new NotImplementedException();
        }

        public void Update(T entity)
        {
            throw new NotImplementedException();
        }
    }
}