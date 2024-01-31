using System;
using Microsoft.Extensions.DependencyInjection;
using NHibernate.Cfg;
using NHibernate.Cfg.MappingSchema;
using NHibernate.Mapping.ByCode;

namespace NHibernate_LoanInjaDB.Infra
{
    public static class NHibernateExtensions
    {
        public static IServiceCollection AddNHibernate(this IServiceCollection services, string connectionString)
        {
            try
            {
                var mapper = new ModelMapper();
                mapper.AddMappings(typeof(NHibernateExtensions).Assembly.ExportedTypes);
                HbmMapping domainMapping = mapper.CompileMappingForAllExplicitlyAddedEntities();

                var configuration = new Configuration();
                configuration.DataBaseIntegration(c =>
                {
                    c.Dialect<NHibernate.Dialect.MsSql2012Dialect>();
                    c.ConnectionString = connectionString;
                    c.KeywordsAutoImport = Hbm2DDLKeyWords.AutoQuote;
                    c.SchemaAction = SchemaAutoAction.Validate;
                    c.LogFormattedSql = true;
                    c.LogSqlInConsole = true;
                });
                configuration.AddMapping(domainMapping);

                var sessionFactory = configuration.BuildSessionFactory();

                services.AddSingleton(sessionFactory);
                services.AddScoped(factory => sessionFactory.OpenSession());

                return services;
            }
            catch (NHibernate.Exceptions.GenericADOException ex)
            {
                // Handle NHibernate exceptions, including schema validation errors
                if (ex.InnerException is NHibernate.SchemaValidationException schemaValidationException)
                {
                    foreach (var validationError in schemaValidationException.ValidationErrors)
                    {
                        Console.WriteLine($"Schema Validation Error: {validationError}");
                    }
                }
                else
                {
                    // Handle other NHibernate-related exceptions
                    Console.WriteLine($"NHibernate Exception: {ex.Message}");
                }

                // Log or handle the exception as needed
                throw;
            }
        }
    }
}
